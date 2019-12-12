FROM debian:10-slim

RUN \
  DEBIAN_FRONTEND=noninteractive; RUNLEVEL=1; \
  apt-get update -qqy && \
  apt-get install -qqy curl make

RUN \
  useradd -m arduino && \
  usermod -a -G dialout arduino && \
  mkdir /etc/sudoers.d/ && \
  echo "%superuser ALL=NOPASSWD:ALL" >>/etc/sudoers.d/arduino-superuser && \
  groupadd superuser && \
  usermod -a -G superuser arduino

RUN \
  curl -fsSL \
  https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | \
  BINDIR=/usr/bin sh

USER arduino

VOLUME /home/arduino/.arduino15
VOLUME /home/arduino/Arduino
WORKDIR /home/arduino/Arduino
ENTRYPOINT ["arduino-cli"]
CMD []
