/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <stdio.h>

/**
 * This is an example C program that can run as a native openwhisk
 * action using the openwhisk/dockerskeleton.
 *
 * The input to the action is received as an argument from the command line.
 * Actions may log to stdout or stderr.
 * By convention, the last line of output must be a stringified JSON object
 * which represents the result of the action.
 */

int main(int argc, char *argv[]) {
    printf("This is an example log message from an arbitrary C program!\n");
    printf("{ \"msg\": \"Hello from arbitrary C program!\", \"args\": %s }",
           (argc == 1) ? "undefined" : argv[1]);
}
