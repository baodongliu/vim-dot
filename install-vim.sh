#!/bin/bash

# On a new machine configure vim from github saving
cd ~
git clone git@github.com:baodongliu/vim-dot.git ~/.vim
ln -s ~/.vim/myvimrc ~/.vimrc
ln -s ~/.vim/mytmux.conf ~/.tmux.conf
cd ~/.vim
git submodule update --init --recursive
git submodule foreach git pull origin master
