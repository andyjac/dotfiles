#!/usr/bin/env bash

brew_package_is_installed() {
  local package=$1

  ! is_macos && return 1

  if brew list "$package" > /dev/null 2>&1; then
    echo "t"
  else
    echo "f"
  fi
}

brew_tap() {
  local tap=$1

  ! is_macos && return 1

  brew tap "$tap"
}

brew_install() {
  local package=$1

  ! is_macos && return 1

  if brew_package_is_installed "$package" == "t"; then
    echo "$package already installed. skipping..."
  else
    brew install $@
  fi
}
