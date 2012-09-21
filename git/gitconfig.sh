#!/bin/bash
git config --global user.name "Leo Jiang"
git config --global user.email leo.jiang.dev@gmail.com
git config --global core.editor vim
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.autocrlf input
git config --global alias.cm commit
git config --global alias.st status
cp _gitignore_global ~/.gitignore_global
