# Ruby
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# source the completion for rvm.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
## source the prompt function and apply it.
#[[ -s "$HOME/.rvm/contrib/ps1_functions" ]] && . "$HOME/.rvm/contrib/ps1_functions"
#ps1_set
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
