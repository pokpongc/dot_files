#!/bin/sh
cd ~
sudo apt update -y
# install glxgears for wslg checking
sudo apt install mesa-utils -y
# zsh
sudo apt install zsh zsh-syntax-highlighting zsh-autosuggestions -y
# C/C++ essentials
sudo apt install build-essential clang cmake make wget curl unzip -y
# vim
sudo apt install vim-gtk3 ctags -y

# install pfetch
mkdir ~/Libraries
cd ~/Libraries
git clone https://github.com/dylanaraps/pfetch.git
sudo install pfetch/pfetch /usr/local/bin/
ls -l /usr/local/bin/pfetch
cd ~

chsh -s /bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Type in the wsl-config directory:
read wsl_config_dir
echo Linking zsh config files...
rm .zshrc
ln -s $wsl_config_dir/.zshrc ~/.zshrc
echo Linking p10k config files...
rm .p10k.zsh
ln -s $wsl_config_dir/.p10k.zsh ~/.p10k.zsh
echo Linking vim config files...
rm .vimrc
ln -s $wsl_config_dir/.vimrc ~/.vimrc
echo Linking dircolor config files...
rm .dircolors
ln -s $wsl_config_dir/.dircolors ~/.dircolors
echo Installing vim plugins ...
vim +'PlugInstall --sync' +qa
