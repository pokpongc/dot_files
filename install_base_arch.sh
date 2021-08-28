#!/bin/sh
cd ~
sudo pacman -Sy
# zsh
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions --noconfirm
# C/C++ essentials
sudo pacman -S gcc clang cmake make wget curl unzip git --noconfirm

# install pfetch
mkdir ~/Libraries
cd ~/Libraries
git clone https://github.com/dylanaraps/pfetch.git
sudo install pfetch/pfetch /usr/local/bin/
ls -l /usr/local/bin/pfetch
cd ~/Libraries
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ~

chsh -s /bin/zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo Type in the wsl-config directory:
read wsl_config_dir
echo Linking zsh config files...
rm ~/.zshrc
ln -s $wsl_config_dir/.zshrc ~/.zshrc
echo Linking p10k config files...
rm ~/.p10k.zsh
ln -s $wsl_config_dir/.p10k.zsh ~/.p10k.zsh
echo Linking dircolor config files...
rm ~/.dircolors
ln -s $wsl_config_dir/.dircolors ~/.dircolorswq
