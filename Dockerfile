FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_MINOR_VERSION=7.1

# add the needed files.
# runs the on the build stage
ADD ./rootfs/opt/build.sh /opt/build.sh
# default entrypoint
ADD ./rootfs/opt/run.sh /opt/run.sh
# services
ADD ./rootfs/etc/service/nginx/run /etc/service/nginx/run
ADD ./rootfs/etc/service/php/run /etc/service/php/run

# install base packages, prepare permissions and run the build
RUN apt-get update && \
    apt-get install -yqq --no-install-recommends \
        runit \
        nginx \
        software-properties-common \
        language-pack-en-base && \
    chmod +x /opt/run.sh /opt/build.sh /etc/service/php/run /etc/service/nginx/run && \
    bash /opt/build.sh

ENTRYPOINT [ "/opt/run.sh" ]
