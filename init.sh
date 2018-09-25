#!/bin/sh

set -o errexit
set -o xtrace

echo hi

cd $HOME
curl -o .toolrc https://raw.githubusercontent.com/martinrhoads/toolbox/master/toolrc
echo 'source $HOME/.toolrc' >> .bashrc
echo 'source $HOME/.toolrc' >> .zshrc

echo bye
