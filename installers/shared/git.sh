#!/usr/bin/env bash

git_clone() {
  repo=$1
  dest=$2

  if [ $(file_exists $dest) == "t" ]; then
    log_found_package $repo
  else
    log_install_package $repo
    git clone repo $dest
  fi
}
