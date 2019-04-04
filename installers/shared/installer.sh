#!/usr/bin/env bash

declare -a _installers=()

array_contains() {
  local n=$#
  local value=${!n}

  for ((i = 1 ; i < $# ; i++)) do
    if [[ "${!i}" == "${value}" ]]; then
      echo "t"
      return 0
    fi
  done

  echo "f"
  return 1
}

require_installer() {
  local name=$1
  local path="$(dotfiles_location)/installers/$name"

  if [[ ! -e $path ]]; then
    log_warning "installer '$name' does not exist. skipping..."
    return 1
  fi

  if [[ $(array_contains "${_installers[@]}" "${name}_installer") == "f" ]]; then
    log_header "installing $name"
    source $path
    log_success "complete."

    _installers+="${name}_installer"
  else
    log_message "$name already installed. skipping..."
  fi

  return 0
}
