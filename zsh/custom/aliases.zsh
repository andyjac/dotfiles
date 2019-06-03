#!/usr/bin/env zsh

#### personal
# alias for starting an emacs client for a particular dir/file
alias ec='function emacs_client() { emacsclient --no-wait -c -a emacs "$@" > /dev/null 2>&1 &; }; emacs_client'
# print aws creds
alias awsprint='cat ~/.aws/credentials'

#### igneous
# hegra aliases
alias hegrabuild='clear && cd ~/code/igneous/mesa/ui && export DEV_STATIC=true && make webapp_hegraroot'
alias hegraserve='cd $HOME/code/igneous/mesa/static/mantle/tools/searchindexer && http-server -p 8001 --cors -c-1 -a localhost'
alias hegrastart='hegrabuild && hegraserve'

# shorter hegra aliases
alias hb='hegrabuild'
alias hh='hegraserve'
alias ha='hegrastart'

# setup tunnel for gamma
alias gammatunnel='ssh -f -N -g -D 6666 aws-dev'

# igneous build commands
alias mesabuild='make clean_images && export DEV_STATIC=true && time make wipe clean all topo12 LITHOS_DISK_SIZE=9000 start-container-services'
alias ctopobuild='make wipe all ctopo bosra-slab deploy-bosra-container-services cloud-bosra TOPO_NAME=btopo1'

local dataset_details_local_url="http://localhost:3000/ux/dataset-details?exportId=2&systemName=35.163.132.140&exportName=/home/nfs/oldmiss2"

alias dd-url='echo $dataset_details_local_url | pbcopy && echo "copied!"'
