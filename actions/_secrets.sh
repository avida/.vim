unpack_secrets() {
   gpg -d $SECRETS_ENC_FN | tar xf -
}

pack_secrets() {
   tar cf - $SECRETS_TMP_DIR/ | gpg --symmetric -o $SECRETS_ENC_FN
}

clear_tmp_secrets() {
 rm -rf $SECRETS_TMP_DIR
}