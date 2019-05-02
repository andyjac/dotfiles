#!/usr/bin/env bash

brew_tap() {
  ! is_macos && return 1

  local tap=$1

  if brew tap | grep "$tap" > /dev/null 2>&1; then
    log_found_package $tap
  else
    log_install_package $tap
    brew tap $@ > /dev/null 2>&1
  fi
}

brew_install() {
  ! is_macos && return 1

  local package=${*: -1}

  if brew list "$package" > /dev/null 2>&1; then
    log_found_package $package
  else
    log_install_package $package
    brew install $@ > /dev/null 2>&1
  fi
}

brew_cask_install() {
  ! is_macos && return 1

  local package=${*: -1}

  if brew cask list "$package" > /dev/null 2>&1; then
    log_found_package $package
  else
    log_install_package $package
    brew cask install $@ > /dev/null 2>&1
  fi
}
