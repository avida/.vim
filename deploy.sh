#!/bin/bash

test -z ${DEBUG+x} || {
   set -x
}

SECRETS_ENC_FN="secrets.gpg"
SECRETS_TMP_DIR="secrets"

PACKAGE_LIST="tmux vim git python3 python3-pip python3-setuptools curl zsh"
PYENV_PACKAGES="zlib1g-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils liblzma-dev python3-venv libffi-dev"

PI_PACKAGE_LIST="wiringpi"
PYTHON_PACKAGES="flask flask_socketio plumbum"
PIP_RASPI="spidev RPi.GPIO redis rq"

PACKAGE_MGR="apt update; apt-get install -y"
ACTIONS_DIR="actions"

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

LIST_OF_ACTIONS=`ls actions | sed s/.sh//`
for ACTION in $LIST_OF_ACTIONS
do
   source $ACTIONS_DIR/$ACTION.sh
done

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
      secrets-unpack)
k        pack_secrets
      ;;
      secrets-pack)
         unpack_secrets
      ;;
      secrets-update)
         unpack_secrets
         pack_secrets
      ;;
      *)
         setup_$action
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
         ACTIONS+=(${OPTARG[@]})
      ;;
      *)
         usage
      ;;
      esac
   done
   process_actions
}

main $@
