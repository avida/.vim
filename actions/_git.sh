function setup_git {
   cat <<<"
[include]
path = `pwd`/gitconfig
" >> $HOME/.gitconfig
   git remote rm origin
   git remote add origin git@github.com:avida/.vim.git
}
