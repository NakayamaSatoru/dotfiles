#!/bin/sh
# 各種install
sudo dnf install -y boost-devel clang cmake eigen3 libtool make ninja-build protobuf-devel vim java-*-openjdk-devel java-*-openjdk-devel ibus-mozc
URL=https://downloads.vivaldi.com/stable
sudo dnf install -y ${URL}/vivaldi-stable-1.14.1077.60-1.x86_64.rpm
# vimの設定
ln -s $HOME/.dotfiles/.vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim
# fishのinstall
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/shells:fish:release:2/Fedora_27/shells:fish:release:2.repo
sudo dnf install fish
# ログインシェルの変更
chsh -s /usr/local/bin/fish
# fishermanのinstall
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
# 設定ファイルの追加
ln -s $HOME/.dotfiles/config.fish ~/.config/fish/config.fish
# powerline系
fisher install omf/theme-bobthefish
git clone git@github.com:powerline/fonts.git
cd fonts
./install.sh
cd ../
rm -rf fonts
# dracula
sudo dnf install dconf -y
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
cd gnome-terminal-colors-dracula
./install.sh
# plugin
fisher install z
fisher install 0rax/fish-bd
sudo wget "https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_386.tar.gz"
sudo tar xzvf peco_linux_386.tar.gz
cd peco_linux_386
sudo chmod +x peco
sudo cp peco /usr/local/bin
fisher oh-my-fish/plugin-peco
