updateAppleSoftware() {
  echo "$fg[yellow] Updating OS X Software Updates $fg[default] "
  sudo softwareupdate --install --all
}

updateHomebrew() {
  echo "$fg[yellow] Updating Homebrew $fg[default] "
  brew update
  brew cask update
  brew upgrade --all

  echo "$fg[yellow] Cleaning up Homebrew $fg[default] "
  brew cleanup
  brew cask cleanup
}

updateGems() {
  echo "$fg[yellow] Updating gem $fg[default]"
  gem update --system
  echo "$fg[yellow] Updating installed gems $fg[default]"
  gem update
}

updateSdk() {
  echo "$fg[yellow] Updating sdkman $fg[default]"
  sdk selfupdate
}

updatePip() {
  echo "$fg[yellow] Updating setuptools, distribute and pip $fg[default]"
  pip install -U setuptools
  pip install -U distribute
  pip install -U pip
  echo "$fg[yellow] Updating outdated pip packages $fg[default]"
  logger "Updating outdated pip packages. Output of pip list --outdated: $(pip list --outdated)"
  pip list --outdated | grep "\d" | cut -d "(" -f 1 | xargs pip install -U
}

updateVagrant() {
  echo "$fg[yellow] Updating vagrant plugins $fg[default]"
  vagrant plugin update
}

updateSystem() {
  updateAppleSoftware
  updateHomebrew
  updateGems
  updateSdk
  updatePip
  updateVagrant
}
