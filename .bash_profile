#
# ~/.bash_profile
#
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export PATH="$PATH:/home/tom/bin"
export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

eval $(lesspipe.sh)
