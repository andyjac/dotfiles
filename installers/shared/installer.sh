#!/usr/bin/env bash

declare -a _installers=()

array_contains () {
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

  if [ ! -e $path ]; then
    log_warning "installer '$name' does not exist. skipping..."
    return 1
  fi

  log_debug "installers: ${_installers[@]}"

  if ! array_contains _installers "${name}_installer"; then
    log_header "install: $name"
    source $path
    log_info "done."

    _installers+=("${name}_installer")
  else
    log_message "$name already installed. skipping..."
  fi

  return 0
}
