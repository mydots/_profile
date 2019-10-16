#!/bin/bash

PATH_TO_FILE="$(cd `dirname $0` && pwd)";
export		RED="[0;31m"
export		GREEN="[0;32m"
export		DEFAULT="[0;39m"

rm -rf ~/.profile ~/.bash_profile ~/.bashrc ~/.zshrc

# Profile; Warning: ~/.profile prevents linux from loading. It's only for Darwin
ln -s ${PATH_TO_FILE}/profile ~/.bashrc
ln -s ${PATH_TO_FILE}/profile ~/.bash_profile
ln -s ${PATH_TO_FILE}/zshrc ~/.zshrc
if [[ $KERNEL = "Darwin" ]]; then 
  ln -s ${PATH_TO_FILE}/profile ~/.profile
fi
