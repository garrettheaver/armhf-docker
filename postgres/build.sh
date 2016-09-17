#!/bin/bash

# This script is used to build the armhf variant of PostgreSQL and uses the
# appropriate version of the armhf-ubuntu container as a base. It must be
# executed on an arm device with a running Docker service which has already
# been authenticated to Docker Hub via `docker login`. The Dockerfile itself
# is based off the official 'postgres' Dockerfile with only very minor
# modifications.

export PG_VERSION=$1
export PG_MAJOR=${PG_VERSION:0:3}
export BASE_IMAGE=${BASE_IMAGE:-armv7/armhf-ubuntu:xenial}
export GOSU_VERSION=${GOSU_VERSION:-1.7}
export LANG=${LANG:-en_US.utf8}
export GNUPGHOME="\$GNUPGHOME"
export BASEPATH="\$PATH"

cat Dockerfile.armhf | envsubst > Dockerfile
docker build --tag "garrettheaver/armhf-postgres:${PG_MAJOR}" . && \
  docker push "garrettheaver/armhf-postgres:${PG_MAJOR}" && \
  rm Dockerfile

