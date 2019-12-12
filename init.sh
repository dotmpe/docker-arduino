#!/bin/bash

mkdir -vp $DCKR_VOL/arduino/tools $HOME/project/arduino-docs
chown -R 1000:1000 $DCKR_VOL/arduino/tools $HOME/project/arduino-docs

mkdir -p arduino-tools
./run.sh -c 'arduino-cli core update-index && \
  arduino-cli core install arduino:avr'
