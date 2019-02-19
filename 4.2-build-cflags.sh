#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Clearing CFLAGS ..a"

unset CFLAGS
echo unset CFLAGS >> ~/.bashrc
