#!/usr/bin/env bash

##install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

brew install git wget cowsay lsd lunchy

# seems to be gone and not sure if needed anymore
# brew install --cask retinizer

brew install --cask caffeine itsycal rectangle sublime-text

brew install --cask brave-browser firefox google-chrome

brew install --cask adobe-acrobat-reader disk-inventory-x \
					easyeda gimp handbrake inkscape   \
					tunnelblick vlc xquartz intellij-idea-ce slack


brew install --cask azure-data-studio microsoft-remote-desktop microsoft-teams \
					microsoft-office


# Install ruby development tools
brew install rbenv ruby-build

# Install python development tools
brew install pyenv poetry

# Install node development tools
brew install nodenv

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
 