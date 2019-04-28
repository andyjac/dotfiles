#!/usr/bin/env bash

#### personal
# alias for starting an emacs client for a particular dir/file
alias ec='function emacs_client() { emacsclient --no-wait -c -a emacs "$@" > /dev/null 2>&1 &; }; emacs_client'

#### igneous
alias hegra-build='clear && cd ~/code/igneous/mesa/ui && export DEV_STATIC=true && make webapp_hegraroot'
alias hegra-serve='cd $HOME/code/igneous/mesa/static/mantle/tools/searchindexer && http-server -p 8001 --cors -c-1 -a localhost'
alias hegra-start='hegra-build && hegra-serve'
alias gammatunnel='ssh -f -N -g -D 6666 aws-dev'

# build mesa from scratch
alias mesa-build='make clean_images && export DEV_STATIC=true && time make wipe clean all topo12 LITHOS_DISK_SIZE=9000 start-container-services'
