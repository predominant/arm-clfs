#!/bin/bash

. _common.sh

build_line "Installing prerequisite tooling .."
sudo apt-get install -y \
  libncurses5-dev \
  texinfo \
  build-essential
