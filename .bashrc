#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
bold="\[$(tput bold)\]"
reset="\[$(tput sgr0)\]"
orange="\[$(tput setf 214)\]"
PS1="[\u@\h $bold$orange\w$reset]\$ "

shopt -s autocd #cd into dir w/o typing cd

alias gst="git status"
alias glo="git log --oneline"
alias glog="git log --oneline --decorate --graph"
alias glg="git log --stat"
alias glgp="git log --stat -p"
alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
alias gd="git diff"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"

alias l="ls -lah"
alias ll="ls -lh"

# sbcl with readline support
alias sbci="rlwrap sbcl"
alias ci="rlwrap csi"

alias chicken-doc-ls="ls /usr/share/chicken/chicken-doc/root"

em () {
	if [ $# -eq 0 ]; then
		emacsclient -c &
	else
		emacsclient -c "$@" &
	fi
}

# 'syncing' directories between terminal sessions
cd () {
	if [ $# -ne 0 ] && [ ! -z $1 ]; then
		if [ -d $1 ]; then
			path=$(realpath $1)
			echo $path >> ~/.cdh
		fi
	fi
	tail -n10 ~/.cdh > ~/.cdhtmp
	mv ~/.cdhtmp ~/.cdh
	builtin cd "$@"
}
cdh () {
	if [ ! -f ~/.cdh ]; then
		echo "Empty directory history"
		return 1;
	fi
	lines=()
	oldIFS=$IFS
	IFS=$'\n' command eval 'lines=($(cat ~/.cdh))'
	IFS=$oldIFS
	len=${#lines[@]}
	for (( i=0; i <${len}; i++ )); do
		echo "$i ${lines[$i]}"
	done
	if [ $# -eq 1 ]; then
		builtin cd ${lines[$1]}
		return 0;
	fi
	read -p 'Pick a number: ' index
	if [[ -z "$index" ]]; then
		return 1;
	fi
	builtin cd ${lines[$index]}
}

[[ -f "${HOME}/.d" ]] && cd "$(< ${HOME}/.d)"

# cursor color, if applicable
[[ -f "${HOME}/.cache/wal/sequences" ]] && cat "${HOME}/.cache/wal/sequences"

# gruvbox 256 palette
[[ -f "${HOME}/.vim/bundle/gruvbox/gruvbox_256palette.sh" ]] && source "${HOME}/.vim/bundle/gruvbox/gruvbox_256palette.sh"
