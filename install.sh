#!/usr/bin/env bash

if [[ $OSTYPE == 'darwin'* ]]; then
    source "./install-macos-software.sh"
elif [[ $OSTYPE == 'linux'* ]]; then
    source "./install-linux-software.sh"
else
    echo "Dont know how to handle '${OSTYPE}'. Exiting..."
    exit 1
fi

#setup antigen and local profile
echo "Creating Repos at ${HOME}/Repos"
mkdir -p "${HOME}/Repos"
REPOS_DIR="${HOME}/Repos"


# Install antigen
if ! [ -f "${HOME}/antigen.zsh" ]; then
  curl -L git.io/antigen > "${HOME}/antigen.zsh"
fi


git clone https://github.com/tlrasor/zshrc.git
ln -s "$REPOS_DIR/zshrc/zshrc.zsh" "${HOME}/.zshrc"


#install sdkman
curl -s "https://get.sdkman.io" | bash 


