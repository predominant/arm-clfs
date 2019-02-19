#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Install libgcc .."
cp -v "${CLFS}/cross-tools/${CLFS_TARGET}/lib/libgcc_s.so.1" "${CLFS}/targetfs/lib/"
"${CLFS_TARGET}-strip" "${CLFS}/targetfs/lib/libgcc_s.so.1"
