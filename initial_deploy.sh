which git > /dev/null || {
   sudo apt update
   sudo apt install git
   git clone https://github.com/avida/.vim.git
   cd .vim
   git remote rm origin
   git remote add origin git@github.com:avida/.vim.git
}
