function setup_neovim {
   wget https://github.com/neovim/neovim/releases/download/v0.6.0/nvim.appimage
   chmod +x nvim.appimage
   ./nvim.appimage --appimage-extract
   pushd squashfs-root
   sudo cp -r usr /
   popd
   rm -r nvim.appimage squashfs-root
   mkdir -p $HOME/.config/nvim/

   ln -sf $HOME/.vim/init.vim ~/.config/nvim/init.vim
}
