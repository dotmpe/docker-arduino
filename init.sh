#!/bin/bash

mkdir -vp $DCKR_VOL/arduino/tools $HOME/project/arduino-docs
touch $DCKR_VOL/arduino/shell-history

./run.sh -c "id -u && id -g"
uid=$(./run.sh -c "id -u")
gid=$(./run.sh -c "id -g")
chown -R $uid:$gid $DCKR_VOL/arduino $HOME/project/arduino-docs

#./run.sh -c 'arduino-cli core update-index && \
#  arduino-cli core install arduino:avr'

./run.sh -c "ls -la ~/Arduino ~/.arduino15"

./exec.sh core update-index
./exec.sh core install arduino:avr
