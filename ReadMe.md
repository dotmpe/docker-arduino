[ ![docker autobuild status](https://img.shields.io/docker/build/dotmpe/arduino.svg) ](https://cloud.docker.com/repository/docker/dotmpe/arduino) Finally a CLI for the Arduino toolchain, and in a container too.

Testing some base-images for different Linux distros, maybe to pick one
already cached by docker. Though with Alpine there is little need to fuss about
size: just a few 10s of megabytes.

The AVR-GCC toolchain does not run with Musl libc, so the official Alpine is
out. But there is ``frolvlad/alpine-glibc``.

There are some missing packages that arduino installs itself (into ``~/.arduino15/packages/builtin/tools``): ctags, serial-discovery. This is also where the
support for different boards go. Like the ``~/Arduino`` folder (with libraries)
it is kept outside of the image (ie. in a volume).

TODO: not building/testing golang base install

#### ``:alpine`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:alpine.svg)](https://microbadger.com/images/dotmpe/arduino:alpine "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/alpine/Dockerfile)
#### ``:minideb`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:minideb.svg)](https://microbadger.com/images/dotmpe/arduino:minideb "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/minideb/Dockerfile)
#### ``:debian`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:debian.svg)](https://microbadger.com/images/dotmpe/arduino:debian "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/debian/Dockerfile)
#### ``:ubuntu`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:ubuntu.svg)](https://microbadger.com/images/dotmpe/arduino:ubuntu "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/ubuntu/Dockerfile)
#### ``:centos`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:centos.svg)](https://microbadger.com/images/dotmpe/arduino:centos "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/centos/Dockerfile)
#### ``:fedora`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:fedora.svg)](https://microbadger.com/images/dotmpe/arduino:fedora "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/fedora/Dockerfile)

Usage:
```sh

  docker run -ti --rm --device /dev/ttyUSB0:/dev/ttyUSB0 \
    -v $HOME/.arduino15:/home/arduino/.arduino15 \
    -v $HOME/Arduino:/home/arduino/Arduino \
    help
```

## Helpers

Two example wrappers and some scripts are there for ease of usage, one to run
the containerized ``arduino-cli`` and another to get a shell:
```sh

  ln -s $PWD/exec.sh /bin/arduino
  ln -s $PWD/run.sh /bin/arduino-shell
```
(use whatever scriptname-alias that suits)

Then, to initialize, e.g.:
```sh

  mkdir -vp /srv/project-local/arduino-docs /srv/docker-volumes-local/arduino/tools
  arduino core update-index
  arduino core install arduino:avr
```

I prefer to manage libraries by hand with GIT submodules.

To test the toolchain:
```sh

  mkdir -vp Blink
  curl -sSf \
    https://raw.githubusercontent.com/arduino/Arduino/master/build/shared/examples/01.Basics/Blink/Blink.ino \
    -o Blink/Blink.ino

  arduino compile -b arduino:avr:pro Blink
  arduino upload -p /dev/ttyUSB0 -b arduino:avr:pro Blink
```

## Autobuilds
See [customized highlander-build hooks](https://github.com/dotmpe/docker-arduino/tree/master/hooks).
