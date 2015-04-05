DOCKER_NAMESPACE =	armbuild/
NAME =			scw-distrib-alpine
VERSION =		latest
VERSION_ALIASES =	3.1.0 3.1 3 edge
TITLE =			Alpine Linux
DESCRIPTION =		Alpine Linux
SOURCE_URL =		https://github.com/scaleway/image-alpine
SHELL =			/bin/bash


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-image-tools | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
