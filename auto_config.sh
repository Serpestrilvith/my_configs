#!/bin/bash

# This script will copy the appropriate configuration files to their respective locations to ensure a homogenious environment

if [[ `cat /etc/issue` == *CentOS* ]]; then
	echo "Updating packages and installing zsh..."
	sudo yum update -y > /dev/null 2>&1
	sudo yum install zsh -y > /dev/null 2>&1
elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	echo "Updating packages and installing zsh..."
	sudo apt-get update > /dev/null 2>&1 && sudo apt-get upgrade -y
	sudo apt-get install zsh -y > /dev/null 2>&1
fi

# Check if zsh is installed
if [ -d ~/.oh-my-zsh ]; then
	break
else
	sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
fi

rm -f ~/.zshrc && cp ./.zshrc ~/

cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

if [[ `echo $SHELL` != *zsh* ]]; then
	chsh -s $(which zsh)
fi