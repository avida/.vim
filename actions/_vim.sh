function setup_vim {
   echo "installing vim plugins"
   ln -s ~/.vim/.vimrc ~/.vimrc
   # install pathogen
   git clone https://github.com/tpope/vim-pathogen.git
   mv vim-pathogen/autoload ./
   mkdir -p bundle
   # install vim-plug
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   # To install plugins run PlugInstall command in vim command mode
}
