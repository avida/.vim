
function setup_base {
   echo "Installing base packages"
   sudo bash -c "$PACKAGE_MGR $PACKAGE_LIST"
   sudo pip3 install $PYTHON_PACKAGE
   #install and config fuzzy finder
   git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
   $HOME/.fzf/install --all
}
