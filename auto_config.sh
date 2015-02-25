#!/bin/bash

# This script will copy the appropriate configuration files to their respective locations to ensure a homogenious environment

if [[ `cat /etc/issue` == *CentOS* ]]; then
	sudo yum update -y

elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	sudo apt-get update && sudo apt-get upgrade
fi

# wrap in if statement
sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh

rm -f ~/.zshrc && cp ./.zshrc ~/