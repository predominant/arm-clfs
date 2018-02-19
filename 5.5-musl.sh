#!/bin/bash

. _common

build_line "i Install musl .."
pushd "${CLFS}/sources"
tar zxf musl-1.1.16.tar.gz
pushd musl-1.1.16

./configure \
  CROSS_COMPILE=${CLFS_TARGET}- \
  --prefix=/ \
  --disable-static \
  --target=${CLFS_TARGET}
make
DESTDIR=${CLFS}/targetfs make install-libs

popd
popd
