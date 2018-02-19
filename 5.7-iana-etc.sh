#!/bin/bash

. _common.sh

build_line "i Install Iana-etc .."

pushd "${CLFS}/sources"
tar jxf iana-etc-2.30.tar.bz2
pushd iana-etc-2.30
patch -Np1 -i ../iana-etc-2.30-update-2.patch
make get
make STRIP=yes
make DESTDIR=${CLFS}/targetfs install
popd
popd
