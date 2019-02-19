#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "Cleaning the build environment at ${CLFS} .."
sudo rm -rf "${CLFS}"
