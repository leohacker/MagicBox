# Git
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
# show the branch name in prompt in git source code folder.
PS1='\n\W$(__git_ps1 " (%s)") \$ '
# e.g. GIT_PS1_SHOWDIRTYSTATE can be overrade by per-repository variable bash.showDirtyState.
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM='git verbose'

export GIT_EDITOR="$EDITOR"
