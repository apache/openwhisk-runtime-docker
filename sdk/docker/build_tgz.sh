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

set -ex

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="${SCRIPTDIR}/../.."
BUILDOUTPUTDIR="${ROOTDIR}/build"
BUILDOUTPUT=$1
BUILDOUTPUT=${BUILDOUTPUT:="blackbox-0.1.0.tar.gz"}

BUILDTMPDIR=`mktemp -d`
mkdir -p ${BUILDTMPDIR}/dockerSkeleton

cp -a \
${SCRIPTDIR}/buildAndPush.sh \
${SCRIPTDIR}/Dockerfile \
${SCRIPTDIR}/example.c \
${SCRIPTDIR}/README.md \
${BUILDTMPDIR}/dockerSkeleton


sed -i -e 's/FROM dockerskeleton/FROM openwhisk\/dockerskeleton/' ${BUILDTMPDIR}/dockerSkeleton/Dockerfile
cat ${BUILDTMPDIR}/dockerSkeleton/Dockerfile
chmod +x ${BUILDTMPDIR}/dockerSkeleton/buildAndPush.sh

mkdir -p ${BUILDOUTPUTDIR}
pushd ${BUILDTMPDIR}
tar -czf ${BUILDOUTPUTDIR}/${BUILDOUTPUT} dockerSkeleton
ls ${BUILDTMPDIR}/dockerSkeleton
ls -lh ${BUILDOUTPUTDIR}/${BUILDOUTPUT}

