#!/bin/bash

if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

user=$(stat -c '%U' .)
group=$(stat -c '%G' .)

tmppath=/tmp/archlinux-live-crypto-build

rm -rf ./dist
rm -rf $tmppath
mkdir $tmppath
cp -R ./src/* $tmppath/
mkdir ./dist

cd $tmppath
chown root:root -R *
./build.sh -v
cd -
cp $tmppath/out/* ./dist/
chown $user:$group -R ./dist