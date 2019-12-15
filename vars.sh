#!/bin/bash

: "${PROJ_DIR:="/srv/project-local"}"
: "${DCKR_VOL:="/srv/docker-volumes-local"}"
: "${tag:="alpine"}"
: "${shell:="ash"}"

export PROJ_DIR DCKR_VOL tag shell
