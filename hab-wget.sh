#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i wget install .. "
pushd "${CLFS}/sources"
tar Jxf wget-1.19.tar.xz
pushd wget-1.19
LIBS="-static -lc -lssl -lcrypto -lz -ldl" \
LDFLAGS="-L${CLFS}/targetfs/lib" \
CPPFLAGS="-I${CLFS}/targetfs/include" \
./configure \
  --prefix="${CLFS}/targetfs" \
  --host="${CLFS_TARGET}" \
  --target="${CLFS_TARGET}" \
  --with-ssl=openssl \
  --with-openssl="${CLFS}/targetfs/lib" \
  --with-zlib="${CLFS}/targetfs/lib"
make
make install
popd
popd
