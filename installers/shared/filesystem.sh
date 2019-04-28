#!/usr/bin/env bash

_current_dir="${BASH_SOURCE%/*}"

dotfiles_location() {
  echo $(cd $_current_dir/../.. && pwd)
}

file_exists() {
  local file=$1

  if [ -e $file ]; then
    echo "t"
  else
    echo "f"
  fi
}

command_exists() {
  local name=$1

  command -v "$name" > /dev/null 2>&1
}

backup_existing_file() {
  local file=$1
  local backup_file="$file.$(date +%s).old"

  log_action_message "backup" $backup_file

  cp -R -L $file $backup_file
  rm -rf $file
}

symlink_dotfile() {
  local file=$1
  local dest=$2
  local full_file_path="$(dotfiles_location)/$file"

  if [ ! $(file_exists $full_file_path) == "t" ]; then
    log_warning "could not find file: $full_file_path"
    return 1
  fi

  # if [ $(file_exists $dest) == "t" ]; then
  #   backup_existing_file $dest
  # fi

  if [ ! $(file_exists $dest) == "t" ]; then
    log_action_message "symlink" "$full_file_path -> $dest"
    ln -s $full_file_path $dest
  else
    log_action_message "found file" $dest
  fi
}
