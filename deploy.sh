#!/bin/bash

PACKAGE_LIST="tmux vim git python3 python3-pip"
PYTHON_LIST=python3-pip 
PIP="flask flask_socketio plumbum"
PACKAGE_MGR="apt-get install -y"

case $1 in
"base")
$PACKAGE_MGR $PACKAGE_LIST
sudo pip3 install $PIP
;;
"config")
ln -s ~/.vim/.vimrc ~/.vimrc
git clone https://github.com/tpope/vim-pathogen.git
mv vim-pathogen/autoload ./
mkdir -p bundle
REPOS=$(awk '{if ($1 == "\"git") print $2}' .vimrc)
cd bundle
for i in $REPOS
   do
      git clone $i 
   done
;;
*)
echo "default"
;;
esac
