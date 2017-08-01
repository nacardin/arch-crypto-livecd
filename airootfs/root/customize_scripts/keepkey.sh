#!/bin/bash

#udev
filepath=/etc/udev/rules.d/51-usb-keepkey.rules

echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="2b24", ATTR{idProduct}=="0001", MODE="0600", SYMLINK+="keepkey%n"' > $filepath
echo 'KERNEL=="hidraw*", ATTRS{idVendor}=="2b24", ATTRS{idProduct}=="0001",  MODE="0600"' >> $filepath

#python2-keepkey
pip2 install keepkey