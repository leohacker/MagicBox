#!/bin/bash

cp -f _vimrc ~/.vimrc

rm -rf ~/.vim/bundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

cd ~/.vim
vim +BundleInstall +qall
