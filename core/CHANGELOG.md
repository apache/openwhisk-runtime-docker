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

# Apache OpenWhisk Docker Runtime Container

## 1.14.0
  - Support for __OW_ACTION_VERSION (openwhisk/4761)

## 1.13.0-incubating
Changes:
  - Update base python image to `python:3.6-alpine`
  - Update current directory for action to be root of zip
  - Update python dependencies gevent(`1.2.1`->`1.3.6`) and flask(`0.12`->`1.0.2`)

## 1.12.0-incubating
  - First Apache incubator release

## 1.3.3
Changes:
  - Update run handler to accept more environment variables [#55](https://github.com/apache/openwhisk-runtime-docker/pull/55)

## 1.3.2
Changes:
  - Fixes bug where a log maker is emitted more than once.

## 1.3.1
Changes:
  - Disallow re-initialization by default. Added environment variable to enable re-initialization for local development.

## 1.3.0
Changes:
  - Added openssh-client.

## 1.2.0
Changes:
  - Added utilities curl and wget.

## 1.1.0
Changes:
  - Allow input parameter larger than 128KB.
  - Added perl language support.
  - Added utilities jq, zip, git.

## 1.0.0
Initial version.
