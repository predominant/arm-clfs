#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Setting up the CLFS user environment .."
cat > ~/.bash_profile << "EOF"
exec env -i HOME="${HOME}" TERM="${TERM}" PS1='\u:\w\$ ' /bin/bash
EOF

cat > ~/.bashrc << EOF
set +h
umask 022
CLFS=${CLFS}
LC_ALL=POSIX
PATH=\${CLFS}/cross-tools/bin:/bin:/usr/bin
export CLFS LC_ALL PATH
EOF
