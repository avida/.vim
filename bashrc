SHELL=$(readlink /proc/$$/exe)

test `basename $SHELL` = "bash" && {
   [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

test `basename $SHELL` = "zsh" && {
   source $HOME/.fzf/shell/key-bindings.zsh
   export ZSH_THEME="jonathan"
   export DISABLE_UNTRACKED_FILES_DIRTY="true"
   [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOPATH:$PATH"
export GOPATH="$HOME/go/bin"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


alias tmux="TERM=screen-256color-bce tmux"
alias tb='nc termbin.com 9999'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'

alias cov='coverage run -m pytest -s unit_tests && coverage  html --omit="*/.pyenv/*" --omit="*/.local/*" && firefox htmlcov/index.html'
alias lab="cd ~/jupyter;pyenv activate 38;jupyter-lab"
alias git="SKIP=mypy git"
alias v=nvim
