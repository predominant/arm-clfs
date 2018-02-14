#!/bin/bash

. _common.sh

build_line "Install Iana-etc .."

pushd "${CLFS}/sources"
tar jxf iana-etc-2.30.tar.bz2
pushd iana-etc-2.30
