#!/bin/sh
set -e
test -z "${DEBUG-}" || set -x

devices=

test ! -e /dev/bus/usb || {
  for dev in /dev/bus/usb/*/*
  do
    devices="$devices --device $dev:$dev"
  done
}

test ! -e /dev/ttyUSB0 || {
  for dev in /dev/ttyUSB*
  do
    devices="$devices --device $dev:$dev"
  done
}

# Only allocate tty if we detect one
if [ -t 0 -a -t 1 ]; then
  DOCKER_RUN_OPTIONS="$DOCKER_RUN_OPTIONS -t"
fi

# Always set -i to support piped and terminal input in run/exec
DOCKER_RUN_OPTIONS="$DOCKER_RUN_OPTIONS -i"

docker run $DOCKER_RUN_OPTIONS --rm \
  $devices \
  -v $arduino_tools:/home/arduino/.arduino15 \
  -v $arduino_docs:/home/arduino/Arduino \
  "$@"
