#
# ~/.bash_profile
#
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP
[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR=vim
export PATH="$PATH:/home/tom/bin"
export PATH="$PATH:/home/tom/.local/bin"
export PATH="$PATH:/home/tom/bin/textadept"
export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
export PATH="$PATH:$HOME/go/bin"
export GOPATH="$HOME/go"

export NNN_USE_EDITOR=1
export NNN_COPIER=/home/tom/bin/nnncp.sh

eval $(lesspipe.sh)
