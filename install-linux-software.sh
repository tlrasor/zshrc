#!/usr/bin/env bash

command -v apt >/dev/null 2>&1 || { echo >&2 "Can't find APT. I only support debian derivatives. Aborting..."; exit 1; }

####
## install apt related stuff
sudo apt -qq update
# install apt utils
sudo apt -qq install apt-transport-https ca-certificates curl gnupg

####
## set up GPG keys and apt sources
#sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#docker
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


####
## Install software

# install and set zsh as default
sudo apt -qq install zsh
chsh -s $(which zsh)

# install general utilities and tools
sudo apt -qq install git pre-commit sublime-text btop iotop aria2

# install docker
sudo apt -qq install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



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