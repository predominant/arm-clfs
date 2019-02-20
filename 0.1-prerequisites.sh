#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "Installing prerequisite tooling .."
sudo apt install ${APT_OPTS:--y} \
  libncurses5-dev \
  texinfo \
  m4 \
  build-essential
