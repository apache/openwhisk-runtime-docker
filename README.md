<!--
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
-->

# Apache OpenWhisk runtimes for docker
[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build Status](https://travis-ci.com/apache/openwhisk-runtime-docker.svg?branch=master)](https://travis-ci.com/github/apache/openwhisk-runtime-docker)


### Give it a try today
Create a zip action with a `exec` in the root of the zip
```
echo \
'#!/bin/bash
echo "{\"message\":\"Hello World\"}"' > exec
```
```
chmod +x exec
zip myAction.zip exec
```

Create the action using the docker image for the runtime
```
wsk action update myAction myAction.zip --docker openwhisk/dockerskeleton:1.3.2
```

This works on any deployment of Apache OpenWhisk

### To use on a deployment that contains the runtime deployed

Create action using `--native`
```
wsk action update myAction myAction.zip --native
```

### Local development
```
./gradlew :core:actionProxy:distDocker :sdk:docker:distDocker
```
This will produce the image `whisk/dockerskeleton`

Build and Push image
```
docker login
./gradlew core:actionProxy:distDocker -PdockerImagePrefix=$prefix-user -PdockerRegistry=docker.io
```

Deploy OpenWhisk using ansible environment that contains the runtime of type `blackboxes` with name `dockerskeleton`
Assuming you have OpenWhisk already deploy locally and `OPENWHISK_HOME` pointing to root directory of OpenWhisk core repository.

Set `ROOTDIR` to the root directory of this repository.

Redeploy OpenWhisk
```
cd $OPENWHISK_HOME/ansible
ANSIBLE_CMD="ansible-playbook -i ${ROOTDIR}/ansible/environments/local"
$ANSIBLE_CMD setup.yml
$ANSIBLE_CMD couchdb.yml
$ANSIBLE_CMD initdb.yml
$ANSIBLE_CMD wipe.yml
$ANSIBLE_CMD openwhisk.yml
```

Or you can use `wskdev` and create a soft link to the target ansible environment, for example:
```
ln -s ${ROOTDIR}/ansible/environments/local ${OPENWHISK_HOME}/ansible/environments/local-docker
wskdev fresh -t local-docker
```

To use as docker action push to your own dockerhub account
```
docker tag whisk/dockerskeleton $user_prefix/dockerskeleton
docker push $user_prefix/dockerskeleton
```
Then create the action using your image from dockerhub
```
wsk action update myAction myAction.zip --docker $user_prefix/dockerskeleton
```
The `$user_prefix` is usually your dockerhub user id.
