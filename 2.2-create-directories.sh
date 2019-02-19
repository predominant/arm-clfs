#!/bin/bash

. _common.sh

build_line "Creating directories .."
mkdir -p "${CLFS}/sources"
chmod 777 "${CLFS}"
