#!/usr/bin/env bash

# check bash
cd bash/
diff -r --brief bash_profile ~/.bash_profile
diff -r --brief bashrc ~/.bashrc
diff -r --brief bin ~/bin
cd - &> /dev/null

# check emacs
cd emacs/emacs-macosx-terminal/
diff -r --brief _emacs ~/.emacs
diff -r --brief _emacs-config ~/.emacs-config
cd - &> /dev/null

# check vim
cd vim
diff -r --brief _vimrc ~/.vimrc
cd - &> /dev/null

# check sublime
cd sublime
diff --brief Distraction\ Free.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
diff --brief Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
diff --brief Pretty\ JSON.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
diff --brief Python.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
diff --brief Pylinter.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
diff --brief Emmet.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
cd - &> /dev/null
