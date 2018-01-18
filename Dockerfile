FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_MINOR_VERSION=7.2

ADD ./rootfs/opt/build.sh /opt/build.sh
ADD ./rootfs/opt/run.sh /opt/run.sh

RUN apt-get update && \
    apt-get install -yqq --no-install-recommends \
        runit \
        nginx \
        software-properties-common \
        language-pack-en-base && \
    chmod +x /opt/run.sh /opt/build.sh && \
    bash /opt/build.sh

ENTRYPOINT [ "/opt/run.sh" ]
