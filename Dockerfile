## -*- docker-image-name: "armbuild/ocs-distrib-alpine:latest" -*-
FROM armbuild/alpine:3.1.0
MAINTAINER Online Labs <opensource@ocs.online.net> (@online_en)


# Environment
ENV OCS_BASE_IMAGE armbuild/ocs-alpine:latest


# Install packages
RUN apk update \
 && apk add \
    bash \
    curl \
    openssh \
    tar \
    wget \
 && apk upgrade \
    openssl

# Patch rootfs
RUN curl -L -q http://j.mp/ocs-scripts > /tmp/ocs-scripts.bash \
 && DL=curl bash -e /tmp/ocs-scripts.bash \
 && rm -f /tmp/ocs-scripts.bash
ADD ./patches/etc/ /etc/


# Configure autostart packages
RUN rc-update add sshd \
 && rc-update add oc-ssh-keys \
 && rc-update add hostname \
 && rc-update add ntpd \
 && rc-update add sysctl \
 && rc-status


# Update permissions
RUN chmod 700 /root
