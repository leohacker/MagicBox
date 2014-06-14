# vim:ft=zsh ts=2 sw=2 sts=2

function git_branch_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$ZSH_THEME_GIT_BRANCH_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_BRANCH_SUFFIX"
  fi
}

function git_status_info() {
  if [[ x"$(git_prompt_status)" == x"" ]]; then
    echo " $(git_remote_status)$(_git_time_since_commit)"
  else
    echo "$ZSH_THEME_GIT_STATUS_PREFIX$(git_prompt_status)$ZSH_THEME_GIT_STATUS_SUFFIX"
  fi
}

function git_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_branch_info)$(git_status_info) $ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_BRANCH_PREFIX="%{$fg[black]%}git:%{$fg[magenta]%}⭠ "
ZSH_THEME_GIT_BRANCH_SUFFIX="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[green]%}="
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[cyan]%}$"
ZSH_THEME_GIT_STATUS_PREFIX="%{$fg[blue]%}["
ZSH_THEME_GIT_STATUS_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$fg[green]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_MEDIUM="%{$fg[yellow]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$fg[red]%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$fg[grey]%}"

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # Get the last commit.
      last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
      now=$(date +%s)
      seconds_since_last_commit=$((now-last_commit))

      # Totals
      minutes=$((seconds_since_last_commit / 60))
      hours=$((seconds_since_last_commit/3600))

      # Sub-hours and sub-minutes
      days=$((seconds_since_last_commit / 86400))
      sub_hours=$((hours % 24))
      sub_minutes=$((minutes % 60))

      if [ $hours -gt 24 ]; then
          commit_age="${days}d"
          color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG
      elif [ $minutes -gt 60 ]; then
          commit_age="${sub_hours}h${sub_minutes}m"
          color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_MEDIUM
      else
          commit_age="${minutes}m"
          color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT
      fi

      echo " %{$fg[black]%}since $color$commit_age%{$reset_color%}"
    fi
  fi
}

# get the difference between the local and remote branches
git_remote_status() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        remote="%{$fg[blue]%}$remote%{$reset_color%}"
        if [ $ahead -gt 0 ]; then
            remote="$remote %{$fg[green]%}+$((ahead))%{$reset_color%}"
        fi
        if [ $behind -gt 0 ]; then
            remote="${remote} %{$fg[red]%}-$((behind))%{$reset_color%}"
        fi
        echo ${remote}
    fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$reset_color%}"

PROMPT='
%{$fg[cyan]%}%3c $(git_info)
${ret_status} '

PROMPT2='$fg_bold[green]%}➦%{$reset_color%}  '
