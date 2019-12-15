#!/bin/bash

mkdir -vp $DCKR_VOL/arduino/tools $HOME/project/arduino-docs
touch $DCKR_VOL/arduino/shell-history
chown -R 1000:1000 $DCKR_VOL/arduino $HOME/project/arduino-docs

#./run.sh -c 'arduino-cli core update-index && \
#  arduino-cli core install arduino:avr'

./exec.sh core update-index
./exec.sh core install arduino:avr
