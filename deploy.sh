#!/bin/bash

test -z ${DEBUG+x} || {
   set -x
}

SECRETS_ENC_FN="secrets.gpg"
SECRETS_TMP_DIR="secrets"

PACKAGE_LIST="tmux vim git python3 python3-pip python3-setuptools curl"
PYENV_PACKAGES="zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils liblzma-dev python3-venv libffi-dev"

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
   git clone ettps://github.com/tpope/vim-pathogen.git
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
   unpack_secrets || {
      echo "Hint: password is c*********9"
      exit 1
   }
   mv $SECRETS_TMP_DIR/key.pem $HOME/.ssh/id_ecdsa
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

function setup_tools {
   echo 'source "$HOME/.vim/bashrc"' >> $HOME/.bashrc
   which zsh && {
      echo 'source "$HOME/.vim/bashrc"' >> $HOME/.zshrc
   }
   ln -sf ~/.vim/tmux.conf ~/.tmux.conf
}

function install_docker {
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker_ce.list
   sudo bash -c "$PACKAGE_MGR docker-ce docker-ce-cli containerd.io"
   sudo usermod -aG docker `id -un`
}

function install_docker_compose {
   sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
}

function install_pyenv {
   sudo bash -c "$PACKAGE_MGR $PYENV_PACKAGES"
   curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
}

function base_install {
   echo "Installing base packages"
   sudo bash -c "$PACKAGE_MGR $PACKAGE_LIST"
   sudo pip3 install $PYTHON_PACKAGE
   #install and config fuzzy finder
   git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
   $HOME/.fzf/install --all
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

function unpack_secrets {
   gpg -d $SECRETS_ENC_FN | tar xf -
}

function pack_secrets {
   tar cf - $SECRETS_TMP_DIR/ | gpg --symmetric -o $SECRETS_ENC_FN
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
         setup_tools
      ;;
      docker)
         install_docker
      ;;
      docker-compose)
         install_docker_compose
      ;;
      pyenv)
         install_pyenv
      ;;
      pack-secrets)
         pack_secrets
      ;;
      unpack-secrets)
         unpack_secrets
      ;;
      append-secrets)
         unpack_secrets
         pack_secrets
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
