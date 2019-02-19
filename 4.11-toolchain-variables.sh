#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Toolchain variables .."

echo export CC=\""${CLFS_TARGET}-gcc --sysroot=${CLFS}/targetfs\"" >> ~/.bashrc
echo export CXX=\""${CLFS_TARGET}-g++ --sysroot=${CLFS}/targetfs\"" >> ~/.bashrc
echo export AR=\""${CLFS_TARGET}-ar\"" >> ~/.bashrc
echo export AS=\""${CLFS_TARGET}-as\"" >> ~/.bashrc
echo export LD=\""${CLFS_TARGET}-ld --sysroot=${CLFS}/targetfs\"" >> ~/.bashrc
echo export RANLIB=\""${CLFS_TARGET}-ranlib\"" >> ~/.bashrc
echo export READELF=\""${CLFS_TARGET}-readelf\"" >> ~/.bashrc
echo export STRIP=\""${CLFS_TARGET}-strip\"" >> ~/.bashrc

source ~/.bashrc
