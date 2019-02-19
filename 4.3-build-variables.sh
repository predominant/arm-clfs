#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Setting up build variables .."

cat  > ~/.clfs_build_variables << EOF
export CLFS_FLOAT="hard"
export CLFS_FPU="vfp"
export CLFS_HOST=$(echo $MACHTYPE | sed "s/-[^-]*/-cross/")
export CLFS_TARGET="arm-linux-musleabihf"
export CLFS_ARCH=arm
export CLFS_ARM_ARCH="armv6j"
EOF

echo ". ~/.clfs_build_variables" >> ~/.bashrc
source ~/.clfs_build_variables
