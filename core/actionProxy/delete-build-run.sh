#!/usr/bin/env bash
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

# Useful for local testing.
# USE WITH CAUTION !!

# This script is useful for testing the action proxy (or its derivatives)
# in combination with [init,run].py. Use it to rebuild the container image
# and start the proxy: delete-build-run.sh whisk/dockerskeleton.

# Removes all previously built instances.
remove=$(docker ps -a -q)
if [[ !  -z  $remove  ]]; then
    docker rm $remove
fi

image=${1:-openwhisk/dockerskeleton}
docker build -t $image .

echo ""
echo "  ---- RUNNING ---- "
echo ""

docker run -i -t -p 8080:8080 $image
