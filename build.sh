#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

rm -rf build
mkdir build
cp -R * build/
chown root:root -R build
./build/archiso.sh