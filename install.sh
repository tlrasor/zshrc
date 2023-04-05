#!/usr/bin/env bash

set -e

REPO_DIR="$(dirname -- "${BASH_SOURCE[0]}")"            # relative
REPO_DIR="$(cd -- "$REPO_DIR" && pwd)"    # absolutized and normalized
if [[ -z "$REPO_DIR" ]] ; then
  # error; for some reason, the path is not accessible
  # to the script (e.g. permissions re-evaled after suid)
  exit 1  # fail
fi
echo "Setting up your environment from $REPO_DIR"

echo "Installing software..."
if [[ $OSTYPE == 'darwin'* ]]; then
    source "./install-macos-software.sh"
elif [[ $OSTYPE == 'linux'* ]]; then
    source "./install-linux-software.sh"
else
    echo "Dont know how to handle '${OSTYPE}'. Exiting..."
    exit 1
fi


echo "Downloading antigen..."
if ! [ -f "${HOME}/antigen.zsh" ]; then
  curl -L git.io/antigen > "${HOME}/antigen.zsh"
fi

echo "Linking zshrc to home directory..."
ln -s "$REPO_DIR/zshrc/zshrc.zsh" "${HOME}/.zshrc"


echo "Installing sdkman..."
curl -s "https://get.sdkman.io" | bash 

echo "All done! You probably need to log out and login."
