Setup configs for fresh system
```
wget https://raw.githubusercontent.com/avida/.vim/master/initial_deploy.sh -O - | bash
cd .vim
./main.bash 
```
and chose deploy and config actions 

Edit config line to disable sudo password:
```
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```
Create env with pyenv:
```
pyenv install 3.7.4
pyenv virtualenv 3.7.4 37
pyenv activate 37
```
To install jupiter:
```
pip install notebook
jupyter notebook
```
Add js kernel to jupiter
```
npm install -g ijavascript
ijsinstall

```
Make zsh default shell:
```
chsh -s $(which zsh)
```
