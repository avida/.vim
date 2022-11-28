function setup_docker {
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker_ce.list
   sudo bash -c "$PACKAGE_MGR docker-ce docker-ce-cli containerd.io"
   sudo usermod -aG docker `id -un`
}
