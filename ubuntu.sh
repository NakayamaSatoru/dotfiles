#!/bin/sh
# install nvim

# install fish
yes | sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
