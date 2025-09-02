function setup_config {
   setup_keys
   # setup_vim
   setup_git
   setup_tools
   # make zsh default shell, reboot required
   chsh -s $(which zsh)
}
setup_config
