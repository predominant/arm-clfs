#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "Creating directories .."
sudo mkdir -p "${CLFS}/sources"
sudo chmod -R 777 "${CLFS}"
