#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Creating the clfs user .."
sudo groupadd "${CLFSUSER}"
sudo useradd -s /bin/bash -g "${CLFSUSER}" -m -k /dev/null "${CLFSUSER}"
sudo chown -Rv "${CLFSUSER}" "${CLFS}"

build_line "i Setup the clfs user password"
sudo passwd "${CLFSUSER}"

build_line "i Switching users"
su - "${CLFSUSER}"
