#!/bin/bash

: "${PROJ_DIR:="/srv/project-local"}"
: "${DCKR_VOL:="/srv/docker-volumes-local"}"
: "${tag:="alpine"}"
: "${shell:="ash"}"
: "${dckr_img:=dotmpe/arduino}"

export PROJ_DIR DCKR_VOL tag shell
