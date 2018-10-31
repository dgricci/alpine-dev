#!/bin/bash
## Dockerfile for compilation environment : C/C++ and make tools

# Exit on any non-zero status.
trap 'exit' ERR
set -E

clean=${1:-n}
clean=${clean:0:1}
clean=${clean,,[N]}

echo "Uninstalling g++, gcc and co ..."
apk update
apk del \
    gcc \
    g++ \
    libc-dev \
    autoconf \
    automake \
    bison \
    flex \
    libtool \
    gettext \
    make \
    cmake

[ "${clean}" != "n" ] && {
    apk cache clean
    rm -rf /var/cache/apk/*
}

exit 0

