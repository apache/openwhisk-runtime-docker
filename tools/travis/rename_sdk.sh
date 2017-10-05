#!/bin/bash
set -ex

# Build script for Travis-CI.

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="$SCRIPTDIR/../.."
BUILDOUTPUTDIR="${ROOTDIR}/build"

BUILD_TYPE=$1
BUILD_VERSION=$2

if [ ${BUILD_TYPE} == "sdk" ]; then
  find ${ROOTDIR}
  ls ${BUILDOUTPUTDIR}/ 
  mv ${BUILDOUTPUTDIR}/blackbox.tar.gz ${BUILDOUTPUTDIR}/blackbox-${BUILD_VERSION}.tar.gz
fi


