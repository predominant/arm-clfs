#!/bin/bash

. _common.sh

declare -A SOURCES=(
  ["http://patches.clfs.org/embedded-dev/iana-etc-2.30-update-2.patch"]=8bf719b313053a482b1e878b75dfc07e
)

build_line "i Fetching patches .."

for URL in "${!SOURCES[@]}"; do
  download_package "${URL}" "${SOURCES[${URL}]}"
done
