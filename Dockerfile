## -*- docker-image-name: "armbuild/scw-distrib-alpine:latest" -*-
FROM armbuild/alpine:3.2.0
MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Environment
ENV SCW_BASE_IMAGE armbuild/scw-alpine:latest


# Add cross-build binaries
ADD ./patches/usr/ /usr/


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
 && DL=curl FLAVORS=openrc,common,docker-based bash -e /tmp/scw-scripts.bash \
 && rm -f /tmp/scw-scripts.bash \
 && /usr/local/sbin/builder-enter
ADD ./patches/etc/ /etc/
ADD ./patches/usr/ /usr/


# Configure autostart packages
RUN rc-update add sshd default\
 && rc-update add ssh-keys default \
 && rc-update add hostname default \
 && rc-update add ntpd default \
 && rc-update add sysctl default \
 && rc-update add initramfs-shutdown shutdown \
 && rc-status


# Update permissions
RUN chmod 700 /root


# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
