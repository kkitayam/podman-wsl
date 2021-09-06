FROM docker.io/mgoltzsche/podman:latest

ARG COMPOSE_VER=0.1.5

RUN apk add --no-cache python3 py3-yaml \
 && apk add --no-cache --virtual .build-deps build-base py3-setuptools \
 && (wget -cqO - https://github.com/containers/podman-compose/archive/refs/tags/v$COMPOSE_VER.tar.gz | tar xz ) \
 && (cd podman-compose-$COMPOSE_VER && python3 setup.py install) \
 && rm -rf podman-compose-$COMPOSE_VER \
 && apk del .build-deps \
 && ln -s /usr/bin/podman-compose /usr/bin/docker-compose

COPY conf/wsl.conf /etc/
