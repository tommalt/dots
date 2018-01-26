#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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

# 'syncing' directories between terminal sessions
cd () {
	if [ $# -ne 0 ]; then
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
	read -p 'Pick a number: ' index
	if [[ -z "$index" ]]; then
		return 1;
	fi
	builtin cd ${lines[$index]}
}
