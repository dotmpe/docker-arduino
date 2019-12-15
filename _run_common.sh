#!/bin/sh
set -e
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

docker run $DOCKER_RUN_OPTIONS --rm -P \
  $devices \
  -v $DCKR_VOL/arduino/tools:/home/arduino/.arduino15 \
  -v $PROJ_DIR/arduino-docs:/home/arduino/Arduino \
  "$@"
