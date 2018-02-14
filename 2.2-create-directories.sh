#!/bin/bash

. _common.sh

build_line "Creating directories .."
sudo mkdir -p "${CLFS}/sources"
sudo chmod 777 "${CLFS}"
