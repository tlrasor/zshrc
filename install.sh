#!/bin/env zsh # new versions of osx use zsh

##install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## install sublime
brew install --cask sublime-text

#setup antigen and local profile
echo "Creating Repos at /Users/$USER/Repos"
mkdir -p /Users/$USER/Repos
REPOS_DIR = /Users/$USER/Repos

git clone https://github.com/zsh-users/antigen.git
ln -s $REPOS_DIR/antigen ~/.antigen




git clone https://github.com/tlrasor/zshrc.git
git checkout osx
ln -s $REPOS_DIR/zshrc/.zshrc ~/.zshrc




## install git curl lsd lunchy
brew install install git curl lsd lunchy  wget cowsay



#install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

#install sdkman
curl -s "https://get.sdkman.io" | bash 


