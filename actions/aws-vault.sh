function setup_aws-vault {
   wget https://github.com/99designs/aws-vault/releases/download/v6.3.1/aws-vault-linux-amd64
   chmod +x aws-vault-linux-amd64
   sudo mv aws-vault-linux-amd64 /usr/local/bin/aws-vault
}
setup_aws-vault

