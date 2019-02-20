#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Clearing CFLAGS ..a"
unset CFLAGS
echo unset CFLAGS >> "${HOME}/.bashrc"
