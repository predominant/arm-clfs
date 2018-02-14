#!/bin/bash

. _common.sh

declare -A SOURCES=(
  ["https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.bz2"]=2869c9bf3e60ee97c74ac2a6bf4e9d68
  ["http://busybox.net/downloads/busybox-1.24.2.tar.bz2"]=2eaae519cac1143bcf583636a745381f
  ["https://gcc.gnu.org/pub/gcc/releases/gcc-6.2.0/gcc-6.2.0.tar.bz2"]=9768625159663b300ae4de2f4745fcc4
  ["https://ftp.gnu.org/gnu/gmp/gmp-6.1.1.tar.bz2"]=4c175f86e11eb32d8bf9872ca3a8e11d
  ["http://sethwklein.net/iana-etc-2.30.tar.bz2"]=3ba3afb1d1b261383d247f46cb135ee8
  ["http://www.kernel.org/pub/linux/kernel/v4.x/linux-4.9.22.tar.xz"]=b6390b3abc02ef4986644fb7051b4568
  ["https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz"]=d6a1d5f8ddea3abd2cc3e98f58352d26
  ["https://ftp.gnu.org/gnu/mpfr/mpfr-3.1.4.tar.bz2"]=b8a2f6b0e68bef46e53da2ac439e1cf4
  ["http://www.musl-libc.org/releases/musl-1.1.16.tar.gz"]=ac52ccaec6b06ab0f289d37e8436859b

  ["http://patches.clfs.org/embedded-dev/iana-etc-2.30-update-2.patch"]=8bf719b313053a482b1e878b75dfc07e
)

build_line "Fetching sources .."

for URL in "${!SOURCES[@]}"; do
  CHECKSUM="${SOURCES[${URL}]}"
  FILENAME="${URL##*/}"
  build_line "  - ${FILENAME} " "blue" 0

  wget --quiet --show-progress -O "${CLFS}/sources/${FILENAME}" "${URL}"
  if [ $? -ne 0 ]; then
    build_line "x ERROR while downloading ${URL}" "red"
    build_line "x Exiting" "red"
    exit 1
  fi

  sum_calculated=$(md5sum "${CLFS}/${FILENAME}" | awk '{print $1}')
  if [ "x${sum_calculated}" != "x${CHECKSUM}" ]; then
    build_line "x FAILED checksum validation for ${URL}" "red"
    exit 1
  fi

  build_line "OK" "green"
done

wget --quiet --show-progress -O "${CLFS}/bootscripts-embedded.tar.gz" "http://git.clfs.org/?p=bootscripts-embedded.git;a=snapshot;h=HEAD;sf=tgz"
