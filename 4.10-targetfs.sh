#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Target Filesystem creation .."
mkdir -p "${CLFS}/targetfs"
