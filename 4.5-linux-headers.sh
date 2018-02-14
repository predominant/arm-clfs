#!/bin/bash

. _common.sh

build_line "Linux headers .."

pushd "${CLFS}/sources"
tar Jxf linux-4.9.22.tar.xz
pushd linux-4.9.22
make mrproper
make ARCH=${CLFS_ARCH} headers_check
make ARCH=${CLFS_ARCH} INSTALL_HDR_PATH=${CLFS}/cross-tools/${CLFS_TARGET} headers_install
popd
popd
