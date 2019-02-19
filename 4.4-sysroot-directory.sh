#!/bin/bash

. _common.sh

build_line "i Setting cross-tools directory up .."

mkdir -p "${CLFS}/cross-tools/${CLFS_TARGET}"
ln -sfv . "${CLFS}/cross-tools/${CLFS_TARGET}/usr"
