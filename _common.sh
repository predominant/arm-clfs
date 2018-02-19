export CLFS="/mnt/clfs"
export CLFSUSER="clfs"
export CLFSCACHE="${CLFS}/sources"

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
yellow='\033[0;33m'
nc='\033[0m'

function build_line() {
  newline="${3:-1}"
  color_str="${2:-green}"
  color="${!color_str}"

  if [ "${newline}" -eq 1 ]; then
    echo -e "${color}${1}${nc}"
  else
    echo -n -e "${color}${1}${nc}"
  fi
}

function clfs_user() {
  current_user=$(whoami)
  if [ "${current_user}" != "${CLFSUSER}" ]; then
    build_line "i Changing to clfs user .."
    su - "${CLFSUSER}"
  fi
}

function checksum_file() {
  local FILENAME=$1
  local CHECKSUM=$2

  sum_calculated=$(md5sum "${FILENAME}" | awk '{print $1}')
  if [ "x${sum_calculated}" != "x${CHECKSUM}" ]; then
    false
  fi
  true
}

function download_package() {
  local URL=$1
  local CHECKSUM=$2
  local FILENAME="${URL##*/}"

  build_line "i Downloading package ${FILENAME} .. " "blue" 0

  if [ -f "${CLFSCACHE}/${FILENAME}" ]; then
    local checkresult=$(checksum_file "${CLFSCACHE}/${FILENAME}" "${CHECKSUM}")
    if ${checkresult}; then
      build_line "CACHE" "green"
      return 0
    else
      build_line "REDOWNLOAD .." "yellow" 0
    fi
  fi

  wget --quiet -O "${CLFSCACHE}/${FILENAME}" "${URL}"

  if [ $? -ne 0 ]; then
    build_line "ERROR while downloading ${URL}" "red"
    build_line "x Exiting" "red"
    exit 1
  fi

  sum_calculated=$(md5sum "${CLFSCACHE}/${FILENAME}" | awk '{print $1}')
  if [ "x${sum_calculated}" != "x${CHECKSUM}" ]; then
    build_line "x FAILED checksum validation for ${URL}" "red"
    exit 1
  fi

  build_line "OK" "green"
}

function expect_user() {
  if [[ "${USER}" != "${1}" ]]; then
    build_line "This script is designed to be run as ${$1}." "red"
    exit 1
  fi
}
