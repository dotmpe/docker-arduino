FROM frolvlad/alpine-glibc

RUN wget https://downloads.arduino.cc/arduino-cli/arduino-cli-latest-linux64.tar.bz2 \
    && tar -C /bin -xvf arduino-cli-latest-linux64.tar.bz2 \
    && rm arduino-cli-latest-linux64.tar.bz2

RUN apk --update add --no-cache ca-certificates shadow

RUN \
  useradd -m arduino && \
  usermod -a -G dialout arduino && \
  mkdir /etc/sudoers.d/ && \
  echo "%superuser ALL=NOPASSWD:ALL" >>/etc/sudoers.d/arduino-superuser && \
  groupadd superuser && \
  usermod -a -G superuser arduino

USER arduino

VOLUME /home/arduino/.arduino15
VOLUME /home/arduino/Arduino
WORKDIR /home/arduino/Arduino
ENTRYPOINT ["arduino-cli"]
CMD []
