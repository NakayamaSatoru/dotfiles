#!/bin/bash
password(){
    if ! ${password+:} false
    then
        printf "password: "
	read -s password
    fi
}
password
mv $HOME/dotfiles $HOME/.dotfiles
$(echo "$password";yes) | sudo -S apt-add-repository ppa:fish-shell/release-3
echo "$password" | sudo -S apt update
echo "$password" | sudo -S apt install -y fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
wget $(curl -s https://golang.org/dl/ | grep -E "https://dl.google.com/go/go.*linux-amd64.tar.gz" | sed -n 's/^.*href="\([^"]*\)".*$/\1/p' | head -n 1)
echo "$password" | sudo -S tar -C /usr/local -xzvf `find . -type f -name "go*linux-amd64.tar.gz"`
rm go*linux-amd64.tar.gz
sh link.sh
go get github.com/motemen/ghq
mkdir $HOME/git
git config --global ghq.root $HOME/git
git clone https://github.com/junegunn/fzf.git ~/.fzf
fish ubuntu.fish
echo "$password" | sudo -S apt install -y fonts-powerline

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
