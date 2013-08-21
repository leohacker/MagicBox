# Ruby
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# source the completion for rvm.
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin
