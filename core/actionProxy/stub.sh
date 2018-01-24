#!/bin/bash

echo \
'This is a stub action that should be replaced with user code (e.g., script or compatible binary).
The input to the action is received from stdin, and up to a size of MAX_ARG_STRLEN (131071) also as an argument from the command line.
Actions may log to stdout or stderr. By convention, the last line of output must
be a stringified JSON object which represents the result of the action.'

# getting arguments from command line
# only arguments up to a size of MAX_ARG_STRLEN (else empty) supported
echo 'command line argument: '$1
echo 'command line argument length: '${#1}

# getting arguments from stdin
read inputstring
echo 'stdin input length: '${#inputstring}

# last line of output = ation result
echo '{ "Status": "Ok" }'
