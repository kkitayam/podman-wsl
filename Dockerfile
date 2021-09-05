FROM mgoltzsche/podman:latest

RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories \
    && apk add --no-cache podman-compose@testing \
    && sed -i -e '$d' /etc/apk/repositories
COPY conf/wsl.conf /etc/
