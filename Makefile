DOCKER_NAMESPACE =	armbuild/
NAME =			scw-distrib-alpine
VERSION =		latest
VERSION_ALIASES =	3.1.0 3.1 3 edge
TITLE =			Alpine Linux
DESCRIPTION =		Alpine Linux
SOURCE_URL =		https://github.com/scaleway/image-alpine
SHELL =			/bin/bash
ASSETS =		patches/usr/bin/qemu-arm-static patches/usr/local/bin/qemu-arm-static


all: help


patches/usr/bin/qemu-arm-static:
	mkdir -p patches/usr/bin
	wget --no-check-certificate https://github.com/armbuild/qemu-user-static/raw/master/x86_64/qemu-arm-static -O $@
	chmod +x $@


patches/usr/local/bin/qemu-arm-static:
	mkdir -p patches/usr/local/bin
	ln -s ../../bin/qemu-arm-static $@


##
## Image tools  (https://github.com/scaleway/image-tools)
##
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
