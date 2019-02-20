#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Toolchain variables .."
echo export CC=\""${CLFS_TARGET}-gcc --sysroot=${CLFS}/targetfs\"" >> "${HOME}/.bashrc"
echo export CXX=\""${CLFS_TARGET}-g++ --sysroot=${CLFS}/targetfs\"" >> "${HOME}/.bashrc"
echo export AR=\""${CLFS_TARGET}-ar\"" >> "${HOME}/.bashrc"
echo export AS=\""${CLFS_TARGET}-as\"" >> "${HOME}/.bashrc"
echo export LD=\""${CLFS_TARGET}-ld --sysroot=${CLFS}/targetfs\"" >> "${HOME}/.bashrc"
echo export RANLIB=\""${CLFS_TARGET}-ranlib\"" >> "${HOME}/.bashrc"
echo export READELF=\""${CLFS_TARGET}-readelf\"" >> "${HOME}/.bashrc"
echo export STRIP=\""${CLFS_TARGET}-strip\"" >> "${HOME}/.bashrc"

source "${HOME}/.bashrc"
