#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

build_line "i Install busybox .."

pushd "${CLFS}/sources"
tar jxf busybox-1.24.2.tar.bz2
pushd busybox-1.24.2

make distclean
make ARCH="${CLFS_ARCH}" defconfig
sed -i 's/\(CONFIG_\)\(.*\)\(INETD\)\(.*\)=y/# \1\2\3\4 is not set/g' .config
sed -i 's/\(CONFIG_IFPLUGD\)=y/# \1 is not set/' .config
sed -i 's/\(CONFIG_FEATURE_WTMP\)=y/# \1 is not set/' .config
sed -i 's/\(CONFIG_FEATURE_UTMP\)=y/# \1 is not set/' .config
sed -i 's/\(CONFIG_UDPSVD\)=y/# \1 is not set/' .config
sed -i 's/\(CONFIG_TCPSVD\)=y/# \1 is not set/' .config

make ARCH="${CLFS_ARCH}" CROSS_COMPILE="${CLFS_TARGET}-"
make ARCH="${CLFS_ARCH}" CROSS_COMPILE="${CLFS_TARGET}-" \
  CONFIG_PREFIX="${CLFS}/targetfs" install

cp -v examples/depmod.pl "${CLFS}/cross-tools/bin"
chmod -v 755 "${CLFS}/cross-tools/bin/depmod.pl"
popd
popd
