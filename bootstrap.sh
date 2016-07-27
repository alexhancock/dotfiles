#!/bin/sh

function install_deps() {
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" 
    # Install cli tools
    brew install vim node python htop postgres redis speedtest_cli docker boot2docker caskroom/cask/brew-cask
    pip install awscli
    # Install apps
    brew cask install alfred sizeup google-chrome google-drive dropbox charles 1password iterm2 virtualbox vlc evernote
}

function doIt() {
    install_deps;

    cd ~/dotfiles/

    # Setup proper paths to all the resources
    rm -f ~/.vimrc && ln -s ~/dotfiles/vim/vimrc ~/.vimrc &&
    rm -f ~/.gvimrc && ln -s ~/dotfiles/vim/gvimrc ~/.gvimrc &&
    rm -f ~/.aliases && ln -s ~/dotfiles/bash/aliases ~/.aliases &&
    rm -f ~/.bash_local && ln -s ~/dotfiles/bash/bash_local ~/.bash_local &&
    rm -f ~/.bash_profile && ln -s ~/dotfiles/bash/bash_profile ~/.bash_profile &&
    rm -f ~/.bashrc && ln -s ~/dotfiles/bash/bashrc ~/.bashrc &&
    rm -f ~/.bash_prompt && ln -s ~/dotfiles/bash/bash_prompt ~/.bash_prompt && 
    rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig &&
    rm -f ~/.vim && ln -s ~/dotfiles/vim ~/.vim

    mkdir ~/vimswap

    cd ~/dotfiles/
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
