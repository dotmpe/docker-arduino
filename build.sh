#!/bin/sh
basedir="$(dirname $(realpath "$0"))"
. $basedir/vars.sh

docker build -t arduino:$tag ./$tag/

./init.sh
