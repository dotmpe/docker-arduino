FROM golang:1.11-stretch

RUN \
  apt update && \
  apt install -qqy curl

RUN \
  useradd -m arduino && \
  usermod -a -G dialout arduino && \
  mkdir /etc/sudoers.d/ && \
  echo "%superuser ALL=NOPASSWD:ALL" >>/etc/sudoers.d/arduino-superuser && \
  groupadd superuser && \
  usermod -a -G superuser arduino

USER arduino

RUN HOME=/home/arduino go get -u github.com/arduino/arduino-cli

VOLUME /home/arduino/.arduino15
VOLUME /home/arduino/Arduino
WORKDIR /home/arduino/Arduino
ENTRYPOINT ["arduino-cli"]
CMD []
