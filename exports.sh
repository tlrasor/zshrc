#environment variables
export SSH_HOME="~/.ssh"
export PUBLIC_KEY="~/.ssh/id_rsa.pub"
export PRIVATE_KEY="~/.ssh/id_rsa"

export GIT_EDITOR=subl
export VISUAL=subl
export EDITOR=subl

if [[ $OSTYPE == 'darwin'* ]]; then
    export BREW_PREFIX="$(brew --prefix)"
    export HOMEBREW_FORCE_BREWED_CURL=1
fi

export M2_HOME="${HOME}/.sdkman/candidates/maven/current"
export M2="${HOME}/.sdkman/candidates/maven/current/bin"
export MAVEN_OPTS="-Xms1024m -Xmx4096m"
