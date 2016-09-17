#! /bin/sh

# This script is used to build the armhf variant of Wharfie and uses the
# appropriate version of the armhf-alpine container as a base. It must be
# executed on an arm device with a running Docker service which has already
# been authenticated to Docker Hub via `docker login`

DOCKER_TAG=${DOCKER_TAG:-garrettheaver/armhf-wharfie}
BASE_IMAGE=${BASE_IMAGE:-container4armhf/armhf-alpine}

# line up the files
git clone https://github.com/garrettheaver/wharfie.git .wharfie && \
  cd .wharfie && \
  sed -i 's|FROM .*:|FROM '"$BASE_IMAGE"':|g' Dockerfile && \
  docker build --tag="$DOCKER_TAG" . && \
  docker push "$DOCKER_TAG" && \
  cd .. && \
  rm -rf .wharfie

