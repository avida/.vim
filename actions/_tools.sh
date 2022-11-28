function setup_tools {
   echo 'source "$HOME/.vim/bashrc"' >> $HOME/.bashrc
   which zsh && {
      sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
      echo 'source "$HOME/.vim/bashrc"' >> $HOME/.zshrc
   }
   ln -sf ~/.vim/tmux.conf ~/.tmux.conf
}
