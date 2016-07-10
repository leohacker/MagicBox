#!/usr/bin/env bash
git config --global user.name "Leo Jiang"
git config --global user.email leo.jiang.dev@gmail.com
git config --global core.editor vim
git config --global core.excludesfile "~/.gitignore_global"
git config --global core.autocrlf input
git config --global push.default simple
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.unstage 'reset HEAD --'
git config --global credential.helper osxkeychain
git config --global color.ui true
cp _gitignore_global ~/.gitignore_global
cp _git-completion.bash ~/.git-completion.bash
cp keys.sh ~/.ssh/
