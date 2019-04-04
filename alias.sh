#!/usr/bin/env bash

# alias for starting an emacs client for a particular dir/file
alias ec='function emacs_client() { emacsclient --no-wait -c -a emacs "$@" > /dev/null 2>&1 &; }; emacs_client'
