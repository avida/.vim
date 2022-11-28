function setup_alacritty {
   sudo bash -c "$PACKAGE_MGR cargo cmake libfontconfig-dev libxcb1-dev libxcb-shape0-dev libxcb-xfixes0-dev"
   cargo install alacritty
}
