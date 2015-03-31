#!/bin/env bash
## install script

## install java

## install xcode tools

## install sublime

##install homebrew

## install zsh git mvn curl

echo "Creating Repos at /Users/$USER/Repos"
mkdir -p /Users/$USER/Repos
REPOS_DIR = /Users/$USER/Repos
git clone https://github.com/junegunn/fzf.git
ln -s $REPOS_DIR/fzf ~/.fzf

git clone https://github.com/zsh-users/antigen.git
ln -s $REPOS_DIR/antigen ~/.antigen

git clone https://github.com/wayneeseguin/rvm.git
ln -s $REPOS_DIR/rvm ~/.rvm

curl -s api.gvmtool.net | bash
mv ~/.gvm $REPOS_DIR/gvm
ln -s $REPOS_DIR/gvm ~/.gvm

git clone https://github.com/tlrasor/zshrc.git
git checkout osx
ln -s $REPOS_DIR/zshrc/.zshrc ~/.zshrc

sudo chsh -s /bin/zsh

