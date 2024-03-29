#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
	brew install cmake macvim
else
    # assuming Ubuntu Linux
	sudo apt install git vim clang build-essential cmake python3-dev autojump
fi

if [ ! -d vim/bundle/Vundle ]
then
    git clone https://github.com/gmarik/vundle.vim.git vim/bundle/vundle
fi
if [ ! -d oh-my-zsh ]
then
    git clone https://github.com/robbyrussell/oh-my-zsh.git
fi

ln -s `pwd`/vim ~/.vim
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/gitconfig ~/.gitconfig
ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/oh-my-zsh ~/.oh-my-zsh


if [[ -d "${HOME}/bin/" ]]; then
	echo "found ${HOME}/bin/"
else
	mkdir ${HOME}/bin
fi
cp git-proxy ${HOME}/bin/

# Now open vim and do `BundleInstall`
