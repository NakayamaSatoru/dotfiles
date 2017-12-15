#!/bin/sh
sudo dnf install -y boost-devel clang cmake eigen3 libtool make ninja-build protobuf-devel vim java-*-openjdk-devel java-*-openjdk-devel ibus-mozc
URL=https://downloads.vivaldi.com/stable
sudo dnf install -y ${URL}/vivaldi-stable-1.11.917.39-1.x86_64.rpm
git clone https://github.com/Shougo/neobundle.vim ~/.dotfile/.vim/bundle/neobundle.vim
cd ~/.dotfile/.vim/bundle/vimproc
make
cd ~/
