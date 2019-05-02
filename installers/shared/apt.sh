#!/usr/bin/env bash

apt_update() {
  ! is_linux && return 1

  log_action_message "apt-get" "update"
  sudo apt-get -y update > /dev/null 2>&1
}

apt_is_installed() {
  ! is_linux && return 1

  local package=$1

  sudo dpkg -s "$package" > /dev/null 2>&1
}

apt_install() {
  ! is_linux && return 1

  local package=${*: -1}

  if ! apt_is_installed "$package"; then
    log_install_package $package
    sudo apt-get install -y $@ > /dev/null 2>&1
  else
    log_found_package $package
  fi
}
