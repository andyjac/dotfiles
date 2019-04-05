#!/usr/bin/env bash

brew_tap() {
  local tap=$1

  ! is_macos && return 1

  brew tap "$tap"
}

brew_install() {
  local package=$1

  ! is_macos && return 1

  if brew list "$package" > /dev/null 2>&1; then
    log_package_not_needed $package
    # log_message "$package already installed. skipping..."
  else
    log_install_package $package
    # log_message "installing $package..."
    brew install $@ > /dev/null 2>&1
  fi
}
