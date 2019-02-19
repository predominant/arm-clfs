#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i zlib install .. "
pushd "${CLFS}/sources"
tar Jxf zlib-1.2.11.tar.xz
pushd zlib-1.2.11
  TARGETMARCH="${CLFS_TARGET}" \
  CROSS="${CLFS_TARGET}" \
  ./configure \
  --prefix="${CLFS}/targetfs"
popd
popd
