#!/bin/sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get -y install neovim

curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
cat /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_14.x focal main
deb-src https://deb.nodesource.com/node_14.x focal main
sudo apt -y install nodejs

sudo npm install -g neovim

sudo apt install -y pyhton3 python3-pip ctags clangd
pip install pylint
python3 -m pip install --user --upgrade pynvim

echo Type in the wsl-config directory:
read wsl_config_dir
ln -s $wsl_config_dir/nvim ~/.config/nvim
ln -s $wsl_config_dir/coc ~/.config/coc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

