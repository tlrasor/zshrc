#environment variables
export SSH_HOME="~/.ssh"
export PUBLIC_KEY="~/.ssh/id_rsa.pub"
export PRIVATE_KEY="~/.ssh/id_rsa"

export GIT_EDITOR=subl
export VISUAL=subl
export EDITOR=subl

export BREW_PREFIX=$(brew --prefix)
export BYOBU_PREFIX=$BREW_PREFIX

export M2_HOME=/Users/travis/.sdkman/candidates/maven/current
export M2=/Users/travis/.sdkman/candidates/maven/current/bin
export MAVEN_OPTS="-Xms1024m -Xmx4096m"
