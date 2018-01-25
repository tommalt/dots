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
