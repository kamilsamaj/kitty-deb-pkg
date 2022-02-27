#!/bin/bash -x
VERSION="0.24.2"
TMP_DIR=$(mktemp -d)
trap "rm -rf $TMP_DIR" EXIT

curl -sL "https://github.com/kovidgoyal/kitty/releases/download/v${VERSION}/kitty-${VERSION}-x86_64.txz" -O

kitty-0.24.2-x86_64.txz
tar xvf kitty-0.24.2-x86_64.txz

mkdir -p "${TMP_DIR}/usr"
mv {bin,lib,share} "$TMP_DIR/usr"
cp -avr DEBIAN "$TMP_DIR"
dpkg-deb -b "$TMP_DIR" kitty-${VERSION}_amd64.deb
