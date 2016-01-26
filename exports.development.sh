#development related exports
export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
export M2_HOME=`brew --prefix maven`/libexec
export M2=`brew --prefix maven`/libexec/bin
export MAVEN_OPTS="-Xms1024m -Xmx4096m"

export GVM_HOME="$HOME/.gvm"

export VAGRANT_PUBLIC_KEY="/Users/travis/Repos/vagrant-settings/id_rsa.pub"
export VAGRANT_PRIVATE_KEY="/Users/travis/Repos/vagrant-settings/id_rsa"

#export PYTHONPATH="$(pyenv which python)"