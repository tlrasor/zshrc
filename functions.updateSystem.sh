updateAppleSoftware() {
  echo "$fg[yellow] Running OS X Software Updates $fg[default] "
  sudo softwareupdate --install --all
}

updateHomebrew() {
  echo "$fg[yellow] Updating Homebrew $fg[default]"
  brew update
  echo "$fg[yellow] Upgrading brews $fg[default]"
  brew outdated
  brew upgrade
  echo "$fg[yellow] Upgrading casks $fg[default]"
  brew cask outdated
  brew cask upgrade
  brew cleanup
}

updateSdkman() {
  echo "$fg[yellow] Updating sdkman $fg[default]"
  sdk selfupdate
  sdk update
  sdk flush archives
  sdk flush temp
}

updateSystem() {
  updateAppleSoftware
  updateHomebrew
  updateSdkman
}