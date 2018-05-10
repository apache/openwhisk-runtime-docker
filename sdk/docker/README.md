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

## Blackbox Actions

1. Download and install the OpenWhisk CLI
2. Install OpenWhisk Docker action skeleton.
3. Add user code
4. Build image
5. Push image
6. Test out action with CLI

The script `buildAndPush.sh` is provided for your convenience. The following command sequence
runs the included example Docker action container using OpenWhisk.

```
# install dockerSkeleton with example
wsk sdk install docker

# change working directory
cd dockerSkeleton

# build/push, argument is your docker hub user name and a valid docker image name
./buildAndPush <dockerhub username>/whiskexample

# create docker action
wsk action create dockerSkeletonExample --docker <dockerhub username>/whiskExample

# invoke created action
wsk action invoke dockerSkeletonExample --blocking
```

The executable file must be located in the `/action` folder.
The name of the executable must be `/action/exec` and can be any file with executable permissions.
The sample docker action runs `example.c` by copying and building the source inside the container
as `/action/exec` (see `Dockerfile` lines 7 and 14).
