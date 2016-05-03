#!/bin/bash

# This script will install the neccesary packages and then copy the appropriate configuration 
# files to their respective locations to ensure a homogenious environment

if [[ `uname -a` == *Darwin* ]]; then
	echo "Installing brew and zsh..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew install wget zsh -y
elif [[ `cat /etc/redhat-release` == *CentOS* ]]; then
	echo "Updating packages and installing zsh..."
	sudo yum update -y
	sudo yum install vim zsh -y
elif [[ `cat /etc/issue` == *Ubuntu* ]]; then
	echo "Updating packages and installing zsh..."
	while true;do echo -n
	sudo apt-get update > /dev/null 2>&1 && sudo apt-get upgrade -y
	sudo apt-get install vim zsh -y
fi

# Check if oh-my-zsh is installed
if [ ! -d ~/.oh-my-zsh ]; then
	echo "Installing oh-my-zsh..."
	sudo sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	cd ~/.oh-my-zsh/custom/plugins
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
	kill $!; trap 'kill $!' SIGTERM
fi

rm -f ~/.zshrc && cp ./.zshrc ~/

if [[ `echo $SHELL` != *zsh* ]]; then
	chsh -s $(which zsh)
fi

DONE=$'\nDone!'
echo "$DONE"