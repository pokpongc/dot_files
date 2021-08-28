#!/bin/sh

sudo pacman -Sy
sudo pacman -S neovim ctags nodejs python python3 python-pip npm clang --noconfirm

pip install pylint 
python3 -m pip install --user --upgrade pynvim

sudo npm install -g neovim
sudo npm i -g vscode-json-languageserver
sudo npm i -g tree-sitter
sudo npm i -g clangd
sudo npm i -g pyright
sudo npm i -g bash-language-server

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo Type in the wsl-config directory:
read wsl_config_dir
mkdir -p ~/.config
ln -s $wsl_config_dir/nvim ~/.config/nvim

