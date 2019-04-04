#!/usr/bin/env bash

DEFAULT="\033[39m"
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
LIGHT_GRAY="\033[37m"
DARK_GRAY="\033[00m"
LIGHT_RED="\033[91m"
LIGHT_GREEN="\033[92m"
LIGHT_YELLOW="\033[93m"
LIGHT_BLUE="\033[94m"
LIGHT_MAGENTA="\033[95m"
LIGHT_CYAN="\033[96m"
WHITE="\033[97m"
RESET="\033[0m"

DEBUG=3
INFO=2
WARNING=1
ERROR=0

LOG_LEVEL=${LOG_LEVEL-$INFO}

log_message() {
  message=$1
  level=${2-$DEFAULT}

  echo -e "${level}${message}${RESET}"
}

log_success() {
  message=$1

  log_message "$message" "$LIGHT_GREEN"
}

log_debug() {
  message=$1

  if [[ $LOG_LEVEL -ge $DEBUG ]]; then
    log_message "$message" "$LIGHT_BLUE"
  fi
}

log_info() {
  message=$1

  if [[ $LOG_LEVEL -ge $INFO ]]; then
    log_message "$message" "$LIGHT_CYAN"
  fi
}

log_warning() {
  message=$1

  if [[ $LOG_LEVEL -ge $WARNING ]]; then
    log_message "$message" "$LIGHT_YELLOW"
  fi
}

log_error() {
  message=$1

  if [[ $LOG_LEVEL -ge $ERROR ]]; then
    log_message "$message" "$LIGHT_RED"
  fi
}
