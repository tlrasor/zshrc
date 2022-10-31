# shortcuts
alias mkdir="mkdir -p "
#alias ls="ls --color=auto -G"
alias grep='grep --color'

alias df="df -h "
alias du='du -hd1'

alias lls="/bin/ls"
alias ls="lsd"

# network and internet
alias sshconfig='subl ~/.ssh'
alias external_ip='curl ifconfig.me'

alias ytdl='youtube-dl -o "$HOME/Downloads/%(extractor)s/%(title)s-%(id)s.%(ext)s" --verbose'
alias ytdlmp3='youtube-dl -o "$HOME/Downloads/%(extractor)s/%(title)s-%(id)s.%(ext)s" --verbose --extract-audio --audio-format mp3'

# zsh related
alias zshconfig="subl $ZSH_CUSTOM"

#general development related aliases
alias mvnsettings="subl ~/.m2/settings.xml"

alias mvn_wrapper="mvn -N io.takari:maven:wrapper"

alias clean_node="find . -name "node_modules" -type d -prune -exec rm -rf '{}' +"
alias clean_mvn="find . -name "target" -type d | sed s/target/pom.xml/ | tee /dev/stderr | xargs -I {} mvn -q clean -f {}"

# ansible
alias ansible-playbook='docker run --rm -it -e 'ANSIBLE_HOST_KEY_CHECKING=False' -v $(pwd):/ansible -v ~/.ssh:/root/.ssh --workdir=/ansible willhallonline/ansible:latest ansible-playbook '
alias ansible='docker run --rm -it -e 'ANSIBLE_HOST_KEY_CHECKING=False' -v $(pwd):/ansible -v ~/.ssh:/root/.ssh --workdir=/ansible willhallonline/ansible:latest '


