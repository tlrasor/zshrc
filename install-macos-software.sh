#!/usr/bin/env bash

##install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update

# general utils
brew install -q <<BREW_UTILS
	aria2
	btop
	cowsay
	curl
	ffmpeg
	git 
	htop
	lsd
	lunchy
	wget
	youtube-dl
	
BREW_UTILS

# install general gui stuff
brew install -q --cask <<BREW_CASKS 
	adobe-acrobat-reader
	brave-browser
	caffeine
	disk-inventory-x
	easyeda
	firefox
	gimp
	google-chrome
	inkscape
	iterm2
	itsycal
	rar
	rectangle
	slack
	sublime-text
	tunnelblick
	vlc
	xquartz

BREW_CASKS

#install microsoft stuff
brew install -q --cask <<BREW_MSFT
	azure-data-studio
	microsoft-auto-update
	microsoft-office 
	microsoft-remote-desktop 
	microsoft-teams

BREW_MSFT

# install extra fonts
brew tap homebrew/cask-fonts
brew install -q --cask font-hack-nerd-font

# install tarsnap
brew install -q tarsnap tarsnap-gui

# Install general development tools
brew install -q <<BREW_DEV_TOOLS
	ansible
	autoconf
	autogen
	automake
	cmake
	freetds
	openssl
	pre-commit
	pkg-config
	readline
	shellcheck
	sqlite3
	xz
	zlib

BREW_DEV_TOOLS

# Install python development tools
brew install -q pyenv poetry tcl-tk 

# Install ruby development tools
brew install -q rbenv ruby-build

# Install node development tools
brew install -q nodenv

# Install java development tools
brew install -q --cask intellij-idea-ce


 