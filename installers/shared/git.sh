#!/usr/bin/env bash

git_clone() {
  local repo=$1
  local dest=$2

  if [ $(file_exists $dest) == "t" ]; then
    log_action_message "found repo" "$repo ($dest)"
  else
    log_action_message "clone" "$repo -> $dest"
    git clone $repo $dest > /dev/null 2>&1
  fi
}
