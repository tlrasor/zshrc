# shortcuts
alias mkdir="mkdir -p "
alias ll="ls -lShra "
alias lt="ls -lthra "
alias grep='grep --color'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

alias df="df -h "
alias du='du -hd1'

# network and internet
alias external_ip='curl ifconfig.me'

alias ytdl='youtube-dl -o "$HOME/Downloads/%(extractor)s/%(title)s-%(id)s.%(ext)s" --verbose'
alias ytdlmp3='youtube-dl -o "$HOME/Downloads/%(extractor)s/%(title)s-%(id)s.%(ext)s" --verbose --extract-audio --audio-format mp3'

# zsh related
alias zshconfig="subl $ZSH_CUSTOM"

#general development related aliases
alias sourcetree="open -a SourceTree"
alias mvnsettings="subl ~/.m2/settings.xml"

alias mvn_wrapper="mvn -N io.takari:maven:wrapper"
