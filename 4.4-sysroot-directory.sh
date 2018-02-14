#!/bin/bash

. _common.sh

mkdir -p "${CLFS}/cross-tools/${CLFS_TARGET}"
ln -sfv . "${CLFS}/cross-tools/${CLFS_TARGET}/usr"
