Setup configs for fresh system
```
wget https://raw.githubusercontent.com/avida/.vim/master/initial_deploy.sh -O - | bash
cd .vim
./deploy.sh -a base -a config
```
Create env with pyenv:
```
pyenv install 3.7.4
pyenv virtualenv 3.7.4 37
pyenv activate 37
```
