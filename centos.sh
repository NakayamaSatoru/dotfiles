#!/bin/sh
# vimの設定
ln -s $HOME/.dotfiles/.vim/.vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/.vim $HOME/.vim
# fishのinstall
cd /etc/yum.repos.d/
wget https://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
sudo yum install fish
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
git clone https://github.com/GalaticStryder/gnome-terminal-colors-dracula
cd gnome-terminal-colors-dracula
./install.sh
# plugin
fisher install z
fisher install 0rax/fish-bd
