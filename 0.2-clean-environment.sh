#!/bin/bash

. _common.sh

build_line "Cleaning the build environment at ${CLFS} .."
rm -rf "${CLFS}"
