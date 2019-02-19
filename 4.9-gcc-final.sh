#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i GCC Final .."

pushd "${CLFS}/sources"
tar jxf gcc-6.2.0.tar.bz2
pushd gcc-6.2.0
tar jxf ../mpfr-3.1.4.tar.bz2
mv -v mpfr-3.1.4 mpfr
tar jxf ../gmp-6.1.1.tar.bz2
mv -v gmp-6.1.1 gmp
tar zxf ../mpc-1.0.3.tar.gz
mv -v mpc-1.0.3 mpc
popd

pushd "${CLFS}/sources/gcc-6.2.0"
patch -Np1 -i ../gcc-6.2.0-update-1.patch
popd

build_dir="${CLFS}/sources/gcc-build"
mkdir -p "${build_dir}"
pushd "${build_dir}"

../gcc-6.2.0/configure \
  --prefix=${CLFS}/cross-tools \
  --build=${CLFS_HOST} \
  --host=${CLFS_HOST} \
  --target=${CLFS_TARGET} \
  --with-sysroot=${CLFS}/cross-tools/${CLFS_TARGET} \
  --disable-nls \
  --enable-languages=c \
  --enable-c99 \
  --enable-long-long \
  --disable-libmudflap \
  --disable-multilib \
  --with-mpfr-include=$(pwd)/../gcc-6.2.0/mpfr/src \
  --with-mpfr-lib=$(pwd)/mpfr/src/.libs \
  --with-arch=${CLFS_ARM_ARCH} \
  --with-float=${CLFS_FLOAT} \
  --with-fpu=${CLFS_FPU}

make
make install
popd

rm -rf "${CLFS}/sources/gcc-6.2.0"
rm -rf "${CLFS}/sources/gcc-build"
