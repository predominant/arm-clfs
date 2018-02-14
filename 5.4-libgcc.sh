#!/bin/bash

. _common.sh

build_line "Install libgcc .."
cp -v "${CLFS}/cross-tools/${CLFS_TARGET}/lib/libgcc_s.so.1" "${CLFS}/targetfs/lib/"
"${CLFS_TARGET}-strip" "${CLFS}/targetfs/lib/libgcc_s.so.1"
