#!/usr/bin/env bash

set -e

if [ "$(id -u)" -ne 0 ]; then
    echo "$0 has to be run as root!"
    exit 1
fi

make clean
cp -R . /usr/src/rtl88x2bu-git || exit 1
sed -i 's/PACKAGE_VERSION="@PKGVER@"/PACKAGE_VERSION="git"/g' /usr/src/rtl88x2bu-git/dkms.conf
dkms add -m rtl88x2bu -v git
dkms autoinstall
