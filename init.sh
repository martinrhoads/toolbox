#!/bin/sh

set -o errexit
set -o xtrace

toolPath=$HOME/.toolrc

if [ -f "$toolPath" ]; then
    echo tool already installed. \"source $toolPath\" and run \"updatetool\".
else
    echo installing tool...
    curl --fail --silent --output $toolPath\
         https://raw.githubusercontent.com/martinrhoads/toolbox/master/toolrc
    echo "source $toolPath" >> .bashrc
    echo "source $toolPath" >> .zshrc
    sudo adduser martin docker
fi
