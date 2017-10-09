#!/bin/bash
set -eux

# Build script for Travis-CI.

SCRIPTDIR=$(cd $(dirname "$0") && pwd)
ROOTDIR="$SCRIPTDIR/../.."
WHISKDIR="$ROOTDIR/../openwhisk"

export OPENWHISK_HOME=$WHISKDIR

IMAGE_PREFIX=$1
IMAGE_NAME=$2
IMAGE_TAG=$3
GRADLE_BUILD=":core:actionProxy:distDocker"

if [ ${IMAGE_NAME} == "dockerskeleton" ]; then
  GRADLE_BUILD=":core:actionProxy:distDocker"
elif [ ${IMAGE_NAME} == "example" ]; then
  GRADLE_BUILD=":sdk:docker:distDocker"
fi

if [[ ! -z ${DOCKER_USER} ]] && [[ ! -z ${DOCKER_PASSWORD} ]]; then
  docker login -u "${DOCKER_USER}" -p "${DOCKER_PASSWORD}"
fi

if [[ ! -z ${GRADLE_BUILD} ]] && [[ ! -z ${IMAGE_PREFIX} ]] && [[ ! -z ${IMAGE_TAG} ]]; then
  TERM=dumb ./gradlew \
  ${GRADLE_BUILD} \
  -PdockerRegistry=docker.io \
  -PdockerImagePrefix=${IMAGE_PREFIX} \
  -PdockerImageTag=${IMAGE_TAG}
fi


