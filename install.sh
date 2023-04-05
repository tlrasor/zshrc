#!/usr/bin/env bash

REPO_DIR="$(dirname -- "${BASH_SOURCE[0]}")"            # relative
REPO_DIR="$(cd -- "$REPO_DIR" && pwd)"    # absolutized and normalized
if [[ -z "$REPO_DIR" ]] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi

if [[ $OSTYPE == 'darwin'* ]]; then
    source "./install-macos-software.sh"
elif [[ $OSTYPE == 'linux'* ]]; then
    source "./install-linux-software.sh"
else
    echo "Dont know how to handle '${OSTYPE}'. Exiting..."
    exit 1
fi


# Install antigen
if ! [ -f "${HOME}/antigen.zsh" ]; then
  curl -L git.io/antigen > "${HOME}/antigen.zsh"
fi


git clone https://github.com/tlrasor/zshrc.git
ln -s "$REPO_DIR/zshrc/zshrc.zsh" "${HOME}/.zshrc"


#install sdkman
curl -s "https://get.sdkman.io" | bash 


