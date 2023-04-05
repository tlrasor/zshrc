#!/usr/bin/env bash

command -v apt >/dev/null 2>&1 || { echo >&2 "Can't find APT. I only support debian derivatives. Aborting..."; exit 1; }

####
## set up GPG keys and apt sources

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list


####
## Install software


sudo apt -qq update

# install apt utils
sudo apt -qq install apt-transport-https

# install and set zsh as default
sudo apt -qq install zsh
chsh -s $(which zsh)

# install general utilities and tools
sudo apt -qq install git sublime-text


# install python build deps
sudo apt -qq install build-essential libssl-dev zlib1g-dev libbz2-dev \
                     libreadline-dev libsqlite3-dev curl libncursesw5-dev \
                     xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev \
                     liblzma-dev python3 python3-dev

# install pyenv
curl https://pyenv.run | bash

# install poetry
curl -sSL https://install.python-poetry.org | python3 -

# install rbenv
sudo apt -qq install rbenv