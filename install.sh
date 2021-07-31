#!/bin/sh

sudo apt install vim
sudo apt install ctags clang gcc cmake
sudo apt install wget curl

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ./.vimrc ~/.vimrc


