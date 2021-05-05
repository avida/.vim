test "$0" = "bash" && {
   [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

test "$0" = "zsh" && {
source $HOME/.fzf/shell/key-bindings.zsh
}

alias tmux="TERM=screen-256color-bce tmux"
alias tb='nc termbin.com 9999'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
