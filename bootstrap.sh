#!/bin/sh

function install_deps() {
    # Assume Git and Ruby
    # Install Homebrew
    curl -fsSkL raw.github.com/mxcl/homebrew/go | ruby
}

function doIt() {
    install_deps;

    cd ~/dotfiles/

    # Build Command-T
    cd ~/dotfiles/vim/bundle/command-t/ruby/command-t/ && ruby extconf.rb && make

    cd ~/dotfiles/vim/bundle/powerline/
    pip install --user git+git://github.com/Lokaltog/powerline
    sudo ./setup.py build && sudo ./setup.py install
    cp ~/dotfiles/vim/fonts/Monaco+for+Powerline.otf ~/Library/fonts/

    # Setup proper paths to all the resources
    rm -f ~/.vimrc && ln -s ~/dotfiles/vim/vimrc ~/.vimrc &&
    rm -f ~/.gvimrc && ln -s ~/dotfiles/vim/gvimrc ~/.gvimrc &&
    rm -f ~/.aliases && ln -s ~/dotfiles/bash/aliases ~/.aliases &&
    rm -f ~/.bash_profile && ln -s ~/dotfiles/bash/bash_profile ~/.bash_profile &&
    rm -f ~/.bashrc && ln -s ~/dotfiles/bash/bashrc ~/.bashrc &&
    rm -f ~/.bash_prompt && ln -s ~/dotfiles/bash/bash_prompt ~/.bash_prompt && 
    rm -f ~/.gitconfig && ln -s ~/dotfiles/gitconfig ~/.gitconfig &&
    rm -f ~/.zshrc && ln -s ~/dotfiles/modules/oh-my-zsh/templates/zshrc ~/.zshrc &&
    rm -f ~/.oh-my-zsh && ln -s ~/dotfiles/modules/oh-my-zsh ~/.oh-my-zsh &&
    rm -f ~/.vim && ln -s ~/dotfiles/vim ~/.vim

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