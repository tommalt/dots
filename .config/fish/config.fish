alias gst="git status"
alias glo="git log --oneline"
alias glog="git log --oneline --decorate --graph"
alias glg="git log --stat"
alias glgp="git log --stat -p"
alias ga="git add"
alias gc="git commit -v"
alias gd="git diff"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"

alias time="time -p"

set -gx EDITOR vis
set -gx LD_LIBRARY_PATH /usr/local/lib
set -gx PKG_CONFIG_PATH /usr/local/lib/pkgconfig
set -gx PATH /home/tom/bin $PATH

function hybrid_keybindings --description "Vi-style bindings stat inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end

set -g fish_key_bindings hybrid_keybindings
