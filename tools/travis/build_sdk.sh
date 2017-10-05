#!/bin/bash
set -ex

# Build script for Travis-CI.

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="$SCRIPTDIR/../.."

#Build SDK TGZ
${ROOTDIR}/sdk/docker/build_tgz.sh blackbox.tar.gz
