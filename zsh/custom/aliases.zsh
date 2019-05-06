#!/usr/bin/env zsh

#### personal
# alias for starting an emacs client for a particular dir/file
alias ec='function emacs_client() { emacsclient --no-wait -c -a emacs "$@" > /dev/null 2>&1 &; }; emacs_client'

#### igneous
# hegra aliases
alias hegrabuild='clear && cd ~/code/igneous/mesa/ui && export DEV_STATIC=true && make webapp_hegraroot'
alias hegraserve='cd $HOME/code/igneous/mesa/static/mantle/tools/searchindexer && http-server -p 8001 --cors -c-1 -a localhost'
alias hegrastart='hegrabuild && hegraserve'

# setup tunnel for gamma
alias gammatunnel='ssh -f -N -g -D 6666 aws-dev'

# build mesa from scratch
alias mesabuild='make clean_images && export DEV_STATIC=true && time make wipe clean all topo12 LITHOS_DISK_SIZE=9000 start-container-services'

# print aws creds
alias awsprint='cat ~/.aws/credentials'

alias datasetdetails-local='http://localhost:3000/ux/dataset-details?exportId=2&systemName=35.163.132.140&exportName=/home/nfs/oldmiss2'
