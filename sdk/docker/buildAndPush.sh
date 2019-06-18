#!/bin/bash
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

#######
# This script will build the docker image and push it to dockerhub.
#
# Usage: buildAndPush.sh imageName
#
# Dockerhub image names look like "username/appname" and must be all lower case.
# For example, "janesmith/calculator"

IMAGE_NAME=$1
echo "Using $IMAGE_NAME as the image name"

# Make the docker image
docker build -t $IMAGE_NAME .
if [ $? -ne 0 ]; then
    echo "Docker build failed"
    exit
fi
docker push $IMAGE_NAME
if [ $? -ne 0 ]; then
    echo "Docker push failed"
    exit
fi
