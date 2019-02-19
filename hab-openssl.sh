#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i OpenSSL install .. "
pushd "${CLFS}/sources"
tar xf openssl-1.1.0g.tar.gz
mkdir -p openssl-build
pushd openssl-build
../openssl-1.1.0g/Configure \
  linux-generic32 \
  --cross-compile-prefix="${CLFS_TARGET}-" \
  --openssldir="${CLFS}/etc/ssl" \
  --prefix="${CLFS}/targetfs" \
  shared no-async
make
make install_sw
popd
popd
