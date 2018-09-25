#!/bin/sh

set -o errexit
set -o xtrace

echo hi

cd $HOME

if [ ! -f "$file" ]; then
    echo 'source $HOME/.toolrc' >> .bashrc
    echo 'source $HOME/.toolrc' >> .zshrc
fi

curl -o .toolrc https://raw.githubusercontent.com/martinrhoads/toolbox/master/toolrc

echo bye
