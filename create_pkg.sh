#!/bin/bash -x
VERSION="0.24.2"  # CHANGE to update


TMP_DIR=$(mktemp -d)
trap 'rm -rf $TMP_DIR' EXIT

curl -sL "https://github.com/kovidgoyal/kitty/releases/download/v${VERSION}/kitty-${VERSION}-x86_64.txz" -O

tar xvf kitty-${VERSION}-x86_64.txz

mkdir -p "${TMP_DIR}/usr"
mv {bin,lib,share} "$TMP_DIR/usr"
mkdir -p "$TMP_DIR/usr/share/terminfo/x"
cp xterm-kitty "$TMP_DIR/usr/share/terminfo/x/"
cp -avr DEBIAN "$TMP_DIR"
sed -i "s/__VERSION__/${VERSION}/g" "${TMP_DIR}/DEBIAN/control"
dpkg-deb -b "$TMP_DIR" kitty-${VERSION}-1_amd64.deb

set +x
echo
echo "kitty-${VERSION}-1_amd64.deb created in the current directory. You can install it with:"
echo "sudo dpkg -i kitty-${VERSION}-1_amd64.deb"
