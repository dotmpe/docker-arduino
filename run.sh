#!/bin/sh
set -e
basedir="$(dirname $(realpath "$0"))"
. $basedir/vars.sh
touch $DCKR_VOL/arduino/shell-history
sh $basedir/_run_common.sh \
  -v $DCKR_VOL/arduino/shell-history:/home/arduino/.${shell}_history \
  --name arduino \
  --entrypoint "$shell" \
  $dckr_img:$tag "$@"
