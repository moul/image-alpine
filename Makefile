DOCKER_NAMESPACE =	armbuild/
NAME =			ocs-distrib-alpine
VERSION =		latest
VERSION_ALIASES =	3.1.0 3.1 3 edge
TITLE =			Alpine Linux
DESCRIPTION =		Alpine Linux
#SOURCE_URL =		https://github.com/online-labs/image-alpine
SHELL =			/bin/bash


## Image tools  (https://github.com/online-labs/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/image-tools | bash
-include docker-rules.mk
## Below you can add custom makefile commands and overrides
