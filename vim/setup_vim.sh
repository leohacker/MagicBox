#!/bin/bash

cp _vimrc ~/.vimrc

mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cd ~/.vim
vim +BundleInstall +qall
