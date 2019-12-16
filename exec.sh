#!/bin/sh
set -e
basedir="$(dirname $(realpath "$0"))"
. $basedir/vars.sh
sh $basedir/_run_common.sh \
  --name arduino-$1 \
  arduino:$tag "$@"
