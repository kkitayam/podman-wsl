#! /usr/bin/env bash
set -eux

CONTEXT=$(dirname $0)/..
IMAGE=$(docker build -q ${CONTEXT})
CONTAINER=$(docker create ${IMAGE})
docker export ${CONTAINER} | xz -9c > podman.tar.xz
docker rm ${CONTAINER}
docker rmi ${IMAGE}
