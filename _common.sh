export CLFS="/mnt/clfs"
export CLFSUSER="clfs"

red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
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
    build_line "Changing to clfs user .."
    su - "${CLFSUSER}"
  fi
}

