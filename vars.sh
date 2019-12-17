#!/bin/bash

test -z "${DEBUG-}" || set -x

: "${DCKR_VOL:="/srv/docker-volumes-local"}"

test -w $DCKR_VOL/arduino && {
  : "${shell_history:="$DCKR_VOL/arduino/shell-history"}"
  : "${arduino_tools:="$DCKR_VOL/arduino/tools"}"
} || {
  : "${shell_history:=arduino_shell_history}"
  : "${arduino_tools:=arduino_tools}"
  docker volume inspect $shell_history >/dev/null ||
    docker volume create $shell_history
  docker volume inspect $arduino_tools >/dev/null ||
    docker volume create $arduino_tools
}

: "${PROJ_DIR:="/srv/project-local"}"
: "${arduino_docs:="$PROJ_DIR/arduino-docs"}"
: "${tag:="alpine"}"
: "${shell:="ash"}"

test -n "${BUILD_CODE:-}" && {
  # Test local-built image on Docker hub
  : "${dckr_img:=arduino}"
} || {
  : "${dckr_img:=dotmpe/arduino}"
}

export PROJ_DIR DCKR_VOL tag shell dckr_img arduino_docs arduino_tools
