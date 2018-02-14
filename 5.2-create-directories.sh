#!/bin/bash

. _common.sh

build_line "Create directories .."

mkdir -p "${CLFS}"/targetfs/{bin,boot,dev,etc,home,lib/{firmware,modules}}
mkdir -p "${CLFS}"/targetfs/{mnt,opt,proc,sbin,srv,sys}
mkdir -p "${CLFS}"/targetfs/var/{cache,lib,local,lock,log,opt,run,spool}
install -dv -m 0750 "${CLFS}"/targetfs/root
install -dv -m 1777 "${CLFS}"/targetfs/{var/,}tmp
mkdir -p "${CLFS}"/targetfs/usr/{,local/}{bin,include,lib,sbin,share,src}
