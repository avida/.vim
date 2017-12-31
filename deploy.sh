#!/bin/bash

PACKAGE_LIST="tmux vim git python3 python3-pip"
PI_PACKAGE_LIST="wiringpi"
PIP="flask flask_socketio plumbum"
PIP_RASPI="spidev RPi.GPIO redis rq"

PACKAGE_MGR="apt-get install -y"

case $1 in
"base")
$PACKAGE_MGR $PACKAGE_LIST
pip3 install $PIP
;;
"config")
echo "installing ssh keys"
mkdir -p ~/.ssh
openssl aes-256-cbc -d -in keys.tgz.aes256cbc.enc -out ~/.ssh/keys.tgz
pushd ~/.ssh
tar -xzf keys.tgz
cat id_rsa.pub >> authorized_keys
chmod 600 /home/pi/.ssh/id_rsa
popd
echo "installing vim plugins"
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
"raspi")
pip3 install $PIP_RASPI
$PACKAGE_MGR $PI_PACKAGE_LIST

*)
echo "default"
;;
esac
