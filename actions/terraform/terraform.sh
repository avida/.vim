function setup_terraform {
  latest=$(
    curl -s https://releases.hashicorp.com/terraform |
      grep -oP '(?<=terraform/)[0-9]+\.[0-9]+\.[0-9]+/' |
      sort -V |
      tail -n1 |
      sed 's/\///g'
  )
  fn="terraform_${latest}_linux_amd64.zip"
  link="https://releases.hashicorp.com/terraform/$latest/$fn"
  echo "Latest terraform version: $latest"
  wget $link

  unzip $fn
  rm $fn
  chmod +x terraform
  sudo mv terraform /usr/local/bin/
}

setup_terraform
