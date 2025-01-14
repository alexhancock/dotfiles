#!/bin/sh

function doIt() {
    cd ~/dotfiles/

    # Setup proper paths to all the resources
    rm -f ~/.zshrc && ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc &&
    rm -f ~/.vimrc && ln -s ~/dotfiles/vim/vimrc ~/.vimrc &&
    rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig &&
    rm -f ~/.vim && ln -s ~/dotfiles/vim ~/.vim

    mkdir -p ~/vimswap

    cd ~/dotfiles/

    echo "SETUP COMPLETE"
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "**** WARNING: This will delete vim/bash/git config files in your home directory and overwrite them. **** Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
