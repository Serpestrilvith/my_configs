#!/bin/bash

# This script will copy the appropriate configuration files to their respective locations to ensure a homogenious environment

if [[ `uname -a` == *Darwin* ]]; then
	echo "Installing brew and zsh..."
	while true;do echo -n .;sleep 1;done &
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null 2>&1
	brew install wget zsh -y > /dev/null 2>&1
elif [[ `cat /etc/issue` == *CentOS* ]]; then
	echo "Updating packages and installing zsh..."
	sudo yum update -y > /dev/null 2>&1
	sudo yum install zsh -y > /dev/null 2>&1
elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	echo "Updating packages and installing zsh..."
	while true;do echo -n .;sleep 1;done &
	sudo apt-get update > /dev/null 2>&1 && sudo apt-get upgrade -y
	sudo apt-get install zsh -y > /dev/null 2>&1
fi

# Check if zsh is installed
if [ ! -d ~/.oh-my-zsh ]; then
	sudo wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
	cd ~/.oh-my-zsh/custom/plugins
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi

rm -f ~/.zshrc && cp ./.zshrc ~/

if [[ `echo $SHELL` != *zsh* ]]; then
	chsh -s $(which zsh)
fi

kill $!; trap 'kill $!' SIGTERM
DONE=$'\nDone!'
echo "$DONE"