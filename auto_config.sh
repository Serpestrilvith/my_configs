#!/bin/bash

# This script will copy the appropriate configuration files to their respective locations to ensure a homogenious environment

if [[ `cat /etc/issue` == *CentOS* ]]; then
	sudo yum update -y

elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	sudo apt-get update && sudo apt-get upgrade
fi

# wrap in if statement
if [ -d ~/.oh-my-zsh ]; then
	rm -rf ~/.oh-my-zsh \
	&& sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
elif
	sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

rm -f ~/.zshrc && cp ./.zshrc ~/