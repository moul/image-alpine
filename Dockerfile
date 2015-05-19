## -*- docker-image-name: "armbuild/scw-distrib-alpine:latest" -*-
FROM armbuild/alpine:3.1.0
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Environment
ENV SCW_BASE_IMAGE armbuild/scw-alpine:latest


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
RUN curl -Lkq http://j.mp/scw-skeleton > /tmp/scw-scripts.bash \
 && DL=curl FLAVORS=openrc,common bash -e /tmp/scw-scripts.bash \
 && rm -f /tmp/scw-scripts.bash
ADD ./patches/etc/ /etc/


# Configure autostart packages
RUN rc-update add sshd default\
 && rc-update add ssh-keys default \
 && rc-update add hostname default \
 && rc-update add ntpd default \
 && rc-update add sysctl default \
 && rc-status


# Update permissions
RUN chmod 700 /root
