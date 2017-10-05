#!/bin/bash
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

