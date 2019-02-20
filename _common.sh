export CLFS="/mnt/clfs"
export CLFSUSER="clfs"
export CLFSCACHE="${CLFS}/sources"

build_line() {
  local red='\033[0;31m'
  local green='\033[0;32m'
  local blue='\033[0;34m'
  local yellow='\033[0;33m'
  local nc='\033[0m'

  local newline="${3:-1}"
  local color="${green}"
  local color_str="${2:-green}"
  case $color_str in
    red)
      color="${red}"
      ;;
    blue)
      color="${blue}"
      ;;
    yellow)
      color="${yellow}"
      ;;
  esac

  if [ "${newline}" -eq 1 ]; then
    echo -e "${color}${1}${nc}"
  else
    printf "${color}${1}${nc}"
  fi
}

clfs_user() {
  local current_user=$(whoami)
  if [ "${current_user}" != "${CLFSUSER}" ]; then
    build_line "e Please switch to the ${CLFSUSER} before continuing:" red
    build_line "  Run:     sudo su - ${CLFSUSER}" red
    exit 1
  fi
}

checksum_file() {
  local FILENAME=$1
  local CHECKSUM=$2

  sum_calculated=$(md5sum "${FILENAME}" | awk '{print $1}')
  if [ "x${sum_calculated}" != "x${CHECKSUM}" ]; then
    false
  fi
  true
}

download_package() {
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

expect_user() {
  if [[ "${USER}" != "${1}" ]]; then
    build_line "This script is designed to be run as ${$1}." "red"
    exit 1
  fi
}
