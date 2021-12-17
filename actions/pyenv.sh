function setup_pyenv {
   sudo bash -c "$PACKAGE_MGR $PYENV_PACKAGES"
   curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
}
