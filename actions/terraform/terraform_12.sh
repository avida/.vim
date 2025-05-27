function setup_terraform_12 {
   version=1.2.9
   wget https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
   unzip terraform_${version}_linux_amd64.zip
   rm terraform_${version}_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}
setup_terraform_12 
