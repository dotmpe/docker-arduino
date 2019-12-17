#!/bin/sh
set -e
test -z "${DEBUG-}" || set -x
basedir="$(dirname $(realpath "$0"))"
test -n "${arduino_docs:-}" || {
  . $basedir/vars.sh
}
sh $basedir/_run_common.sh \
  -v $shell_history:/home/arduino/.${shell}_history \
  --name arduino \
  --entrypoint "$shell" \
  $dckr_img:$tag "$@"
