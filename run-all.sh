#!/bin/bash

set -uo pipefail

export CLFSROOT=/opt/arm-clfs
export DEBIAN_PRIORITY=critical
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true
# export APT_OPTS="--assume-yes --no-install-suggests --no-install-recommends -o Dpkg::Options::=\"--force-confdef\" -o Dpkg::Options::=\"--force-confold\""
export APT_OPTS="--assume-yes --no-install-suggests --no-install-recommends"

run_step() {
  local step="${1}"
  local step_script="${CLFSROOT}/${step}.sh"
  local lock_file="/tmp/${step}.lock"

  if [ ! -f "${step_script}" ]; then
    echo "ERROR: Could not find shell script for step: ${step}"
    return 1
  fi

  if [ -f "${lock_file}" ]; then
    echo "Skipping step ${step}"
    return 0
  fi

  echo "----------------------------------------------------------------------"
  echo "Step : ${step}"
  echo "----------------------------------------------------------------------"

  "${step_script}"

  local status=$?
  if [ $status -eq 0 ] || [ $status -eq 2 ]; then
    # Touch the lock file to indicate completion for status 0 or 2.
    # 0 indicates success
    # 2 is used for success, but specifies a stop / restart is required for
    #   some reason.
    touch "${lock_file}"
  fi
  
  if [ $status -ne 0 ]; then
    exit $status
  fi
  return $status
}

run_step 0.0-package-update
run_step 0.1-prerequisites
run_step 0.2-clean-environment
run_step 1.2-version-check
run_step 2.2-create-directories
run_step 2.3-all-packages
run_step 2.4-patches
run_step 3.2-adding-the-clfs-user
run_step 3.3-setting-up-the-environment
run_step 4.10-targetfs
run_step 4.11-toolchain-variables
run_step 4.2-build-cflags
run_step 4.3-build-variables
run_step 4.4-sysroot-directory
run_step 4.5-linux-headers
run_step 4.6-binutils
run_step 4.7-gcc
run_step 4.8-musl
run_step 4.9-gcc-final
run_step 5.2-create-directories
run_step 5.3-passwd-group-lastlog
run_step 5.4-libgcc
run_step 5.5-musl
run_step 5.6-busybox
run_step 5.7-iana-etc
