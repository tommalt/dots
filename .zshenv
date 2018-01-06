## environment variables for the zsh shell
#
# less colors
#
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# ALIASES
alias td="tree -d"

alias mc="make clean"
alias mcm="(make clean; make)"

function cd
{
	builtin cd "$@"
	pwd > ~/.last_dir
}

# file/directory size
alias sizeof="du -sh"
alias cdd='cd $(cat ~/.last_dir)'
alias dots='vim ~/dots'

# do not clear screen when using less
alias less="less -X"
