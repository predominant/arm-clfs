#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Setting cross-tools directory up .."
mkdir -p "${CLFS}/cross-tools/${CLFS_TARGET}"
ln -sfv "${CLFS}/cross-tools" "${CLFS}/cross-tools/${CLFS_TARGET}/usr"
