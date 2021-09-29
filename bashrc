SHELL=$(readlink /proc/$$/exe)

test "$SHELL" = "/bin/bash" && {
   [ -f ~/.fzf.bash ] && source ~/.fzf.bash
}

test "$SHELL" = "/bin/zsh" && {
   source $HOME/.fzf/shell/key-bindings.zsh
   export ZSH_THEME="jonathan"
   export DISABLE_UNTRACKED_FILES_DIRTY="true"
}

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


alias tmux="TERM=screen-256color-bce tmux"
alias tb='nc termbin.com 9999'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'

alias cov='coverage run -m pytest -s unit_tests && coverage  html --omit="*/.pyenv/*" && firefox htmlcov/index.html'
alias lab="cd ~/jupyter;pyenv activate 38;jupyter-lab"
alias git="SKIP=mypy git"
