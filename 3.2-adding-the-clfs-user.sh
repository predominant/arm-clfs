#!/bin/bash

. _common.sh


build_line "Creating the clfs user .."
sudo groupadd "${CLFSUSER}"
sudo useradd -s /bin/bash -g "${CLFSUSER}" -m -k /dev/null "${CLFSUSER}"
sudo chown -Rv "${CLFSUSER}" "${CLFS}"

build_line "Setup the clfs user password"
sudo passwd "${CLFSUSER}"

build_line "Switching users"
su - "${CLFSUSER}"
