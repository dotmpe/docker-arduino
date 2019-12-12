#!/bin/sh
set -e
devices=
for dev in /dev/ttyUSB*
do
  devices="$devices --device $dev:$dev"
done
docker run -ti --rm -P \
  $devices \
  -v $DCKR_VOL/arduino/tools:/home/arduino/.arduino15 \
  -v $PROJ_DIR/arduino-docs:/home/arduino/Arduino \
  "$@"
