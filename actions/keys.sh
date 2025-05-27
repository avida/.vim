function setup_keys {
   echo "installing ssh keys"
   mkdir -p $HOME/.ssh
   unpack_secrets || {
      echo "Hint: password is c*********9"
      exit 1
   }
   mv $SECRETS_TMP_DIR/id_ecdsa $HOME/.ssh/
   chmod 600 $HOME/.ssh/id_ecdsa
	ssh-keygen -f $HOME/.ssh/id_ecdsa -y > $HOME/.ssh/id_ecdsa.pub
   pushd $HOME/.ssh
   cat id_ecdsa.pub >> authorized_keys
   popd
}
setup_keys