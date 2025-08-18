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
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$GOPATH:$PATH"
export GOPATH="$HOME/go/bin"
source $HOME/.local/bin/env
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


alias tmux="TERM=screen-256color-bce tmux"
alias tb='nc termbin.com 9999'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias tf='terraform'

alias cov='coverage run -m pytest -s unit_tests && coverage  html --omit="*/.pyenv/*" --omit="*/.local/*" && firefox htmlcov/index.html'
alias lab="cd ~/jupyter;pyenv activate 311;jupyter-lab"
alias git="SKIP=mypy git"
alias t="tmux"
alias ta="tmux attach"
alias td="tmux detach"
alias sup="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias i="sudo apt install"
alias pi="pip install"
alias v=nvim
