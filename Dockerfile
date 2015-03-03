## -*- docker-image-name: "armbuild/ocs-distrib-alpine:latest" -*-
FROM armbuild/alpine:latest
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Environment
ENV OCS_BASE_IMAGE armbuild/ocs-alpine:latest


# Install packages
RUN apk add openssh


# Configure autostart packages
RUN rc-update add sshd \
 && rc-status


# Patch rootfs
# RUN wget -qO - http://j.mp/ocs-scripts | bash
ADD ./patches/etc/ /etc/
