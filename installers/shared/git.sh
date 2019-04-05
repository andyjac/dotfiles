#!/usr/bin/env bash

git_clone() {
  repo=$1
  dest=$2

  if [ $(file_exists $dest) == "t" ]; then
    log_message "repo $repo exists. skipping..."
  else
    log_info "cloning $repo into $dest..."
    git clone repo $dest
  fi
}
