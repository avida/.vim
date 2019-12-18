#!/bin/bash

test -z ${DEBUG+x} || {
   set -x
}

PACKAGE_LIST="tmux vim git python3 python3-pip curl"
PYENV_PACKAGES="zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils liblzma-dev python3-venv"

PI_PACKAGE_LIST="wiringpi"
PYTHON_PACKAGES="flask flask_socketio plumbum"
PIP_RASPI="spidev RPi.GPIO redis rq"

PACKAGE_MGR="apt update; apt-get install -y"
function usage {
   echo "Deploy script for setting up system config
   Options:
    -a Type of action for setting up environment. Could be raspi, base or config. You can use it multiple times.
       Possible actions are: raspi, base, config, docker
       For example use this on your fresh system:
         ./deploy.sh -a base -a config -a docker -a pyenv
    -h Print this help
   "
   exit 0
}

function setup_vim {
   echo "installing vim plugins"
   ln -s ~/.vim/.vimrc ~/.vimrc
   git clone https://github.com/tpope/vim-pathogen.git
   mv vim-pathogen/autoload ./
   mkdir -p bundle
   REPOS=$(awk '{if ($1 == "\"git") print $2}' .vimrc)
   pushd bundle
   for i in $REPOS
      do
         git clone $i
      done
   popd
}

function setup_keys {
   echo "installing ssh keys"
   mkdir -p $HOME/.ssh
   gpg  key.pem.gpg || {
      echo "Hint: password is c*********9"
      exit 1
   }
   mv key.pem $HOME/.ssh/id_ecdsa
   chmod 600 $HOME/.ssh/id_ecdsa
	ssh-keygen -f $HOME/.ssh/id_ecdsa -y > $HOME/.ssh/id_ecdsa.pub
   pushd $HOME/.ssh
   cat id_ecdsa.pub >> authorized_keys
   popd
}

function setup_git {
   cat <<<"
[include]
path = `pwd`/gitconfig
" >> $HOME/.gitconfig
   git remote rm origin
   git remote add origin git@github.com:avida/.vim.git
}

function install_docker {
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable"
   sudo bash -c "$PACKAGE_MGR docker-ce docker-ce-cli containerd.io"
   sudo usermod -aG docker `id -un`

}

function install_pyenv {
   sudo bash -c "$PACKAGE_MGR $PYENV_PACKAGES"
   curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
   cat <<< '
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
' >> $HOME/.bashrc
}

function base_install {
   echo "Installing base packages"
   sudo bash -c "$PACKAGE_MGR $PACKAGE_LIST"
   sudo pip3 install $PYTHON_PACKAGES
}

function raspi_install {
   base_install
   echo "Installing python packages"
   pip3 install $PIP_RASPI
   echo "Installin application from linux repository"
   sudo bash -c "$PACKAGE_MGR $PI_PACKAGE_LIST"
   echo "Installing pynrf24 lib"
   git clone https://github.com/jpbarraca/pynrf24.git pynrf24
   pushd pynrf24
   python3 setup.py install
   popd
   rm -rf pynrf24
}

function process_actions {
   for action in ${ACTIONS[@]}
   do
      case $action in
      raspi|pi)
         echo this is paspi
         raspi_install
      ;;
      base)
         base_install
      ;;
      config)
         setup_keys
         setup_vim
         setup_git
      ;;
      docker)
         install_docker
      ;;
      pyenv)
         install_pyenv
      ;;
      *)
         echo "Unknown action $action"
      ;;
      esac
   done
}

function main {
   while getopts "a:h" opt
   do
      case $opt in
      h)
         usage
      ;;
      a)
         ACTIONS+=($OPTARG)
      ;;
      *)
         usage
      ;;
      esac
   done
   process_actions
}

main $@
