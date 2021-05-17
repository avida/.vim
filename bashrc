SHELL=$(readlink /proc/$$/exe)

test "$SHELL" = "/bin/bash" && {
   [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

test "$SHELL" = "/bin/zsh" && {
   source $HOME/.fzf/shell/key-bindings.zsh
   export ZSH_THEME="jonathan"
}

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

alias tmux="TERM=screen-256color-bce tmux"
alias tb='nc termbin.com 9999'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'
