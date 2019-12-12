FROM bitnami/minideb:stretch

RUN install_packages curl make ca-certificates

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

ENV PATH=/bin:/usr/bin:/usr/local/bin
USER arduino

VOLUME /home/arduino/.arduino15
VOLUME /home/arduino/Arduino
WORKDIR /home/arduino/Arduino
ENTRYPOINT ["arduino-cli"]
CMD []
