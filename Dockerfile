## -*- docker-image-name: "armbuild/ocs-distrib-alpine:latest" -*-
FROM armbuild/alpine:3.1.0
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Environment
ENV OCS_BASE_IMAGE armbuild/ocs-alpine:latest


# Install packages
RUN apk add \
    openssh \
    wget \
    bash \
    tar


# Patch rootfs
RUN wget --no-check-certificate --quiet -O- http://j.mp/ocs-scripts | bash -e
ADD ./patches/etc/ /etc/


# Configure autostart packages
RUN rc-update add sshd \
 && rc-update add oc-ssh-keys \
 && rc-status
