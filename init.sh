#!/bin/bash
set -e
test -z "${DEBUG-}" || set -x

echo "Initializing docker-arduino...">&2
test -n "${arduino_docs:-}" || {
  . ./vars.sh
}

echo "Setting up volume">&2
sh ./_run_common.sh \
  -v $shell_history:/home/arduino/.${shell}_history \
  --entrypoint "$shell" \
  -u root \
  $dckr_img:$tag -c "chown -R arduino:arduino /home/arduino/.arduino15/ /home/arduino/Arduino && ls -la /home/arduino/Arduino /home/arduino/.arduino15"

echo "Updating arduino-tools">&2
./exec.sh core update-index
./exec.sh core install arduino:avr
