FROM docker:latest

# The docker-compose binary won't run on Alpine (issue #3465)
RUN apk add --no-cache py-pip && \
    pip install docker-compose

RUN curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine
