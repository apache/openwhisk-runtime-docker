#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import base64
from json import dumps
import os
import sys

import flask

DEFAULT_METHOD = ['POST']
VALID_METHODS = set(['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'])

OW_ENV_PREFIX = '__OW_'

# A stem cell is an openwhisk container that is not 'pre-initialized'
# with the code in the environment variable '__OW_ACTION_CODE'
# returns a boolean
def isStemCell():
    actionCode = os.getenv('__OW_ACTION_CODE', '')
    return len(actionCode) == 0

# Checks to see if the activation data is in the request
# returns a boolean
def hasActivationData(msg):
    return 'activation' in msg and 'value' in msg

# Checks to see if the initialization data is in the request
# returns a boolean
def hasInitData(msg):
    return 'init' in msg

def removeInitData(body):
    def delIfPresent(d, key):
        if key in d:
            del d[key]
    if body and 'value' in body:
        delIfPresent(body['value'], 'code')
        delIfPresent(body['value'], 'main')
        delIfPresent(body['value'],'binary')
        delIfPresent(body['value'], 'raw')
        delIfPresent(body['value'], 'actionName')

# create initialization data from environment variables
# return dictionary
def createInitDataFromEnvironment():
    initData = {}
    initData['main'] = os.getenv('__OW_ACTION_MAIN', 'main')
    initData['code'] = os.getenv('__OW_ACTION_CODE', '')
    initData['binary'] = os.getenv('__OW_ACTION_BINARY', 'false').lower() == 'true'
    initData['actionName'] = os.getenv('__OW_ACTION_NAME', '')
    initData['raw'] = os.getenv('__OW_ACTION_RAW', 'false').lower() == 'true'
    return initData

def preProcessInitData(initData, valueData, activationData):
    def presentAndType(mapping, key, dataType):
        return key in mapping and isinstance(mapping[key], dataType)

    if len(initData) > 0:
        if presentAndType(initData, 'main', str):
            valueData['main'] = initData['main']
        if presentAndType(initData, 'code', str):
            valueData['code'] = initData['code']

        try:
            if presentAndType(initData, 'binary', bool):
                valueData['binary'] = initData['binary']
            elif 'binary' in initData:
                raise InvalidInitValueType('binary', 'boolean')

            if presentAndType(initData, 'raw', bool):
                valueData['raw'] = initData['raw']
            elif 'raw' in initData:
                raise InvalidInitValueType('raw', 'boolean')

        except InvalidInitValueType as e:
            print(e, file=sys.stderr)
            raise InvalidInitData(e)

        # Action name is a special case, as we have a key collision on "name" between init. data and request
        # param. data so we must save it to its final location as the default Action name as part of the
        # activation data
        if presentAndType(initData, 'name', str):
            if 'action_name' not in activationData or \
               (isinstance(activationData['action_name'], str) and \
                len(activationData['action_name']) == 0):
                activationData['action_name'] = initData['name']

def preProcessHTTPContext(msg, valueData):
    if valueData.get('raw', False):
        if isinstance(msg.get('value', {}), str):
            valueData['__ow_body'] = msg.get('value')
        else:
            tmpBody = msg.get('value', {})
            removeInitData(tmpBody)
            bodyStr = str(tmpBody)
            valueData['__ow_body'] = base64.b64encode(bodyStr.encode())
        valueData['__ow_query'] = flask.request.query_string

    namespace = ''
    if '__OW_NAMESPACE' in os.environ:
        namespace = os.getenv('__OW_NAMESPACE')
    valueData['__ow_user'] = namespace
    valueData['__ow_method'] = flask.request.method
    valueData['__ow_headers'] = { k: v for k, v in flask.request.headers.items() }
    valueData['__ow_path'] = ''

def preProcessActivationData(activationData):
    for k in activationData:
        if isinstance(activationData[k], str):
            environVar = OW_ENV_PREFIX + k.upper()
            os.environ[environVar] = activationData[k]

def preProcessRequest(msg):
    valueData = msg.get('value', {})
    if isinstance(valueData, str):
        valueData = {}
    initData = msg.get('init', {})
    activationData = msg.get('activation', {})

    if hasInitData(msg):
        preProcessInitData(initData, valueData, activationData)

    if hasActivationData(msg):
        preProcessHTTPContext(msg, valueData)
        preProcessActivationData(activationData)

    msg['value'] = valueData
    msg['init'] = initData
    msg['activation'] = activationData

def postProcessResponse(requestHeaders, response):
    CONTENT_TYPE = 'Content-Type'
    content_types = {
        'json': 'application/json',
        'html': 'text/html',
    }

    statusCode = response.status
    headers = {}
    body = response.get_json() or {}
    contentTypeInHeaders = False

    # if a status code is specified set and remove from the body
    # of the response
    if 'statusCode' in body:
        statusCode = body['statusCode']
        del body['statusCode']

    if 'headers' in body:
        headers = body['headers']
        del body['headers']

    # content-type vs Content-Type
    # make Content-Type standard
    if CONTENT_TYPE.lower() in headers:
        headers[CONTENT_TYPE] = headers[CONTENT_TYPE.lower()]
        del headers[CONTENT_TYPE.lower()]

    # if there is no content type specified make it html for string bodies
    # and json for non-string bodies
    if not CONTENT_TYPE in headers:
        if isinstance(body, str):
            headers[CONTENT_TYPE] = content_types['html']
        else:
            headers[CONTENT_TYPE] = content_types['json']
    else:
        contentTypeInHeaders = True

    # a json object containing statusCode, headers, and body is what we expect from a web action
    # so we only want to return the actual body
    if 'body' in body:
        body = body['body']

    # if we are returning an image that is base64 encoded, we actually want to return the image
    if contentTypeInHeaders and 'image' in headers[CONTENT_TYPE]:
        body = base64.b64decode(body)
        headers['Content-Transfer-Encoding'] = 'binary'
    else:
        body = dumps(body)

    if statusCode == 200 and len(body) == 0:
        statusCode = 204 # no content status code

    if 'Access-Control-Allow-Origin' not in headers:
        headers['Access-Control-Allow-Origin'] = '*'

    if 'Access-Control-Allow-Methods' not in headers:
        headers['Access-Control-Allow-Methods'] = 'OPTIONS, GET, DELETE, POST, PUT, HEAD, PATCH'

    if 'Access-Control-Allow-Headers' not in headers:
        headers['Access-Control-Allow-Headers'] = 'Authorization, Origin, X - Requested - With, Content - Type, Accept, User - Agent'
        if 'Access-Control-Request-Headers' in requestHeaders:
            headers['Access-Control-Request-Headers'] = requestHeaders['Access-Control-Request-Headers']
    return flask.Response(body, statusCode, headers)

class KnativeImpl:

    def __init__(self, proxy):
        self.proxy = proxy
        self.initCode = None
        self.runCode = None

    def _run_error(self):
        response = flask.jsonify({'error': 'The action did not receive a dictionary as an argument.'})
        response.status_code = 404
        return response

    def run(self):
        response = None
        message = flask.request.get_json(force=True, silent=True) or {}
        request_headers = flask.request.headers
        dedicated_runtime = False

        if message and not isinstance(message, dict):
            return self._run_error()

        try:
            # don't process init data if it is not a stem cell
            if hasInitData(message) and not isStemCell():
                raise NonStemCellInitError()

            # if it is a dedicated runtime and is uninitialized, then init from environment
            if not isStemCell() and self.proxy.initialized is False:
                message['init'] = createInitDataFromEnvironment()
                dedicated_runtime = True

            preProcessRequest(message)
            if hasInitData(message) and hasActivationData(message) and not dedicated_runtime:
                self.initCode(message)
                removeInitData(message)
                response = self.runCode(message)
                response = postProcessResponse(request_headers, response)
            elif hasInitData(message) and not dedicated_runtime:
                response = self.initCode(message)
            elif hasActivationData(message) and not dedicated_runtime:
                response = self.runCode(message)
                response = postProcessResponse(request_headers, response)
            else:
                # This is for the case when it is a dedicated runtime, but has not yet been
                # initialized from the environment
                if dedicated_runtime and self.proxy.initialized is False:
                    self.initCode(message)
                    removeInitData(message)
                response = self.runCode(message)
                response = postProcessResponse(request_headers, response)
        except Exception as e:
            response = flask.jsonify({'error': str(e)})
            response.status_code = 404

        return response


    def registerHandlers(self, initCodeImp, runCodeImp):

        self.initCode = initCodeImp
        self.runCode = runCodeImp

        httpMethods = os.getenv('__OW_HTTP_METHODS', DEFAULT_METHOD)
        # try to turn the environment variable into a list if it is in the right format
        if isinstance(httpMethods, str) and httpMethods[0] == '[' and httpMethods[-1] == ']':
            httpMethods = httpMethods[1:-1].split(',')
        # otherwise just default if it is not a list
        elif not isinstance(httpMethods, list):
            httpMethods = DEFAULT_METHOD

        httpMethods = {m.upper() for m in httpMethods}

        # use some fancy set operations to make sure all the methods are valid
        # and remove any that aren't
        invalidMethods = httpMethods.difference(set(VALID_METHODS))
        validMethods = list(httpMethods.intersection(set(VALID_METHODS)))
        if len(invalidMethods) > 0:
            for invalidMethod in invalidMethods:
                print("Environment variable '__OW_HTTP_METHODS' has an unrecognised value (" + invalidMethod + ").",
                      file=sys.stderr)

        self.proxy.add_url_rule('/', 'run', self.run, methods=validMethods)

class NonStemCellInitError(Exception):
    def __str__(self):
        return "Cannot initialize a runtime with a dedicated function."

class InvalidInitValueType(Exception):
    def __init__(self, key, valueType):
        self.key = key
        self.valueType = valueType

    def __str__(self):
        return f"Invalid Init. data; expected {self.valueType} for key '{self.key}'."

class InvalidInitData(Exception):
    def __init__(self, msg):
        self.msg = msg

    def __str__(self):
        return f"Unable to process Initialization data: {self.msg}"
