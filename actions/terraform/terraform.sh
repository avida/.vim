function setup_terraform {
   wget https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_linux_amd64.zip
   unzip terraform_0.15.2_linux_amd64.zip
   rm terraform_0.15.2_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}
setup_terraform