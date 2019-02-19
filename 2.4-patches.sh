#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

declare -A SOURCES=(
  ["http://patches.clfs.org/embedded-dev/iana-etc-2.30-update-2.patch"]=8bf719b313053a482b1e878b75dfc07e
  ["https://gist.githubusercontent.com/predominant/8d40b874e98c54a91cc638a31dc914ee/raw/ad019bf6391606915f6d1ee6143e21255343246f/gcc-6.2.0-update-1.patch"]=1ac5611085ec706a5de3f73e9a0ba2e9
)

build_line "i Fetching patches .."

for URL in "${!SOURCES[@]}"; do
  download_package "${URL}" "${SOURCES[${URL}]}"
done
