#!/usr/bin/env bash

# Use this when the names are the same
install_package() {
  local package=$1

  if is_macos; then
    brew_install "$package"
  elif is_linux; then
    apt_install "$package"
  fi
}

command_exists() {
  local name=$1

  command -v "$name" > /dev/null 2>&1
}
