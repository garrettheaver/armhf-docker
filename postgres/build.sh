#!/bin/bash

export PG_VERSION=$1
export PG_MAJOR=${PG_VERSION:0:3}
export BASE_IMAGE="armv7/armhf-ubuntu:xenial"
export GNUPGHOME="\$GNUPGHOME"
export GOSU_VERSION="1.7"
export LANG="en_US.utf8"

cat Dockerfile.armhf | envsubst > Dockerfile
docker build --tag "garrettheaver/armhf-postgres:${PG_MAJOR}" . && \
  docker push "garrettheaver/armhf-postgres:${PG_MAJOR}" && \
  rm Dockerfile

