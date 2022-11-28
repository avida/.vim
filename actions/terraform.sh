function setup_terraform {
   wget https://releases.hashicorp.com/terraform/0.15.2/terraform_0.15.2_linux_amd64.zip
   unzip terraform_0.15.2_linux_amd64.zip
   rm terraform_0.15.2_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}

function setup_terraform_1 {
   version=1.0.11
   wget https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
   unzip terraform_${version}_linux_amd64.zip
   rm terraform_${version}_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}

function setup_terraform_12 {
   version=1.2.9
   wget https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
   unzip terraform_${version}_linux_amd64.zip
   rm terraform_${version}_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}

function setup_terraform_13 {
   version=1.3.3
   wget https://releases.hashicorp.com/terraform/$version/terraform_${version}_linux_amd64.zip
   unzip terraform_${version}_linux_amd64.zip
   rm terraform_${version}_linux_amd64.zip
   chmod +x terraform
   sudo mv terraform /usr/local/bin/
}
