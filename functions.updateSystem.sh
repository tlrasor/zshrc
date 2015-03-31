updateAppleSoftware() {
  echo "$fg[yellow] Updating OS X Software Updates $fg[default] "
  sudo softwareupdate --install --all
}

updateHomebrew() {
  echo "$fg[yellow] Updating Homebrew $fg[default] "
  brew update
  brew upgrade

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

updateGvm() {
  echo "$fg[yellow] Updating gvm $fg[default]"
  gvm selfupdate
}

updatePip() {
  echo "$fg[yellow] Updating setuptools, distribute and pip $fg[default]"
  pip install --update setuptools
  pip install --update distribute
  pip install --update pip
  echo "$fg[yellow] Updating outdated pip packages $fg[default]"
  logger "Updating outdated pip packages. Output of pip list --outdated: $(pip list --outdated)"
  pip list --outdated | grep "\d" | cut -d "(" -f 1 | xargs pip install --upgrade
}

updateSystem() {
  updateAppleSoftware
  updateHomebrew
  updateGems
  updateGvm
}
