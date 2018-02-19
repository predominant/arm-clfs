#!/bin/bash

. _common.sh

build_line "i Binutils .."

build_dir="${CLFS}/sources/binutils-build"
mkdir -p "${build_dir}"

pushd "${CLFS}/sources"
tar jxf binutils-2.27.tar.bz2

pushd "${build_dir}"
../binutils-2.27/configure \
  --prefix=${CLFS}/cross-tools \
  --target=${CLFS_TARGET} \
  --with-sysroot=${CLFS}/cross-tools/${CLFS_TARGET} \
  --disable-nls \
  --disable-multilib
make configure-host
make
make install
popd
popd
