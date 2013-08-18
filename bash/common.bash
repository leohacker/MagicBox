# Common
export PS1="\h:\W $ "
export HISTSIZE=200
export HISTIGNORE="&:[ ]*:exit:ls:ll:cd[ ]*:cd -[ ]*:[bf]g:history"

# Alias
alias ll='ls -l'
export EDITOR='subl -n -w'

# Path
PATH=/usr/local/bin:$PATH
PATH=$PATH:~/bin
export PATH
