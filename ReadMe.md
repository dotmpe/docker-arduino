[ ![docker autobuild status](https://img.shields.io/docker/build/dotmpe/arduino.svg) ](https://cloud.docker.com/repository/docker/dotmpe/arduino) [![Docker Pulls](https://img.shields.io/docker/pulls/dotmpe/arduino.svg?style=flat-square)](https://hub.docker.com/r/dotmpe/arduino/) Finally a CLI for the Arduino toolchain, and in a container too.

### Info
Testing some base-images for different Linux distros, maybe to pick one
already cached by docker. Though with Alpine there is little need to fuss about
size: just a few 10s of megabytes.

The AVR-GCC toolchain does not run with Musl libc, so the official Alpine is
out. But there is ``frolvlad/alpine-glibc`` [github](https://github.com/Docker-Hub-frolvlad/docker-alpine-glibc).

There are some missing packages that arduino installs itself (into ``~/.arduino15/packages/builtin/tools``): ctags, serial-discovery. This is also where the
support for different boards go. Like the ``~/Arduino`` folder (with libraries)
it is kept outside of the image (ie. in a volume).

#### ``:alpine`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:alpine.svg)](https://microbadger.com/images/dotmpe/arduino:alpine "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/alpine/Dockerfile)
#### ``:minideb`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:minideb.svg)](https://microbadger.com/images/dotmpe/arduino:minideb "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/minideb/Dockerfile)
#### ``:debian-slim`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:debian-slim.svg)](https://microbadger.com/images/dotmpe/arduino:debian-slim "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/debian-slim/Dockerfile)
#### ``:debian`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:debian.svg)](https://microbadger.com/images/dotmpe/arduino:debian "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/debian/Dockerfile)
#### ``:ubuntu`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:ubuntu.svg)](https://microbadger.com/images/dotmpe/arduino:ubuntu "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/ubuntu/Dockerfile)
#### ``:centos`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:centos.svg)](https://microbadger.com/images/dotmpe/arduino:centos "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/centos/Dockerfile)
#### ``:fedora`` [![image size/layers](https://images.microbadger.com/badges/image/dotmpe/arduino:fedora.svg)](https://microbadger.com/images/dotmpe/arduino:fedora "microbadger.com image metadata") [ ![Dockerfile](https://img.shields.io/badge/Dockerfile-GitHub-blue.svg) ](https://github.com/dotmpe/docker-arduino/blob/master/fedora/Dockerfile)

Usage:
```sh

  docker run -ti --rm --name arduino --device /dev/ttyUSB0:/dev/ttyUSB0 \
    -v $HOME/.arduino15:/home/arduino/.arduino15 \
    -v $HOME/Arduino:/home/arduino/Arduino \
    dotmpe/arduino:alpine \
    help
```

## Desiderata

The Alpine/glibc image is working for my AVR/Atmega328p needs so far. Every
package but curl and certificates has been removed from the images, idk. if
those (make, git) are needed somewhere.

The fedora and centos images have permission issues on the USB tty device.

The Docker hub build is fairly long, would be nice to split up to branches.
And add version numbers to keep older versions.

Also up for build/test is a golang based install.

## Autobuilds
See [customized highlander-build hooks](https://github.com/dotmpe/docker-arduino/tree/master/hooks)
for tags.
The ``latest`` tag is put on the `Alpine` image.

## Docs
See [wiki](https://github.com/dotmpe/docker-arduino/wiki) at github, or local
``docs`` directory.
