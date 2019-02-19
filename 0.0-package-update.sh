#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "Installing package updates .."
sudo apt-get update ${APT_OPTS:--y} > /dev/null
sudo apt-get upgrade ${APT_OPTS:--y} > /dev/null
