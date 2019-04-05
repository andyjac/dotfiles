#!/usr/bin/env bash

declare -a _installers=()
declare -a _excluded_installers=()

array_contains() {
    local array="$1[@]"
    local seeking=$2
    local in=1

    for element in "${!array}"; do
      if [[ $element == $seeking ]]; then
        in=0
        break
      fi
    done

    return $in
}

require_installer() {
  local name=$1
  local path="$(dotfiles_location)/installers/$name"
  local installer_name="${name}_installer"

  if array_contains _excluded_installers $installer_name; then
    log_header "skipping: $name"
    return 0
  fi

  if [ ! -e $path ]; then
    log_warning "installer '$name' does not exist. skipping..."
    return 1
  fi

  log_debug "installers: ${_installers[@]}"

  if ! array_contains _installers $installer_name; then
    log_header "install: $name"
    source $path
    log_info "done."

    _installers+=($installer_name)
  fi

  return 0
}
