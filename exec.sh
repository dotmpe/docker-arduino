#!/bin/sh
basedir="$(dirname $(realpath "$0"))"
. $basedir/vars.sh
sh $basedir/_run_common.sh \
  arduino:$tag "$@"
