#!/usr/bin/env bash

shared_dir="${BASH_SOURCE%/*}/shared"

if [[ "$SOURCED_SHARED_DOTFILES" != "t" ]]
then
  source "$shared_dir/os.sh"
  source "$shared_dir/brew.sh"
  source "$shared_dir/installer.sh"
  source "$shared_dir/log.sh"
  source "$shared_dir/filesystem.sh"
  source "$shared_dir/git.sh"
  source "$shared_dir/apt.sh"
  source "$shared_dir/packages.sh"

  SOURCED_SHARED_DOTFILES="t"
fi
