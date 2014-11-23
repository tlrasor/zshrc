# shortcuts
alias mkdir="mkdir -p "
alias ll="ls -lShra "
alias lt="ls -lthra "
alias df="df -h "
alias psgrep="ps aux | grep "
alias vlc=" vlc "
alias vnull="vim -u /dev/null "
alias v="vim "
alias vi="vim -u ~/Projects/vimrc/essential.vim"
alias pwgen="< /dev/urandom tr -dc 'A-Za-z0-9\\?!=-_' | head -c13"
alias :q="exit"
alias todo="vim ~/Projects/notes/todo"
alias apt="sudo aptitude "
alias reboot="sudo shutdown -r now"
alias mutt="mutt -R"
alias forls="IFS=\$'\n'"
alias pipes="~/Playground/pipes.sh"
alias diskusage='du -hd1|sort -h'

# custom shortcuts
alias dlist="dumpr.sh --list=list"
alias turl="curl --socks5-hostname 127.0.0.1:9050 "
alias vagrant_reboot="vagrant destroy -f && vagrant up"
alias diskanalize='baobab'

alias pingoogle="ping 8.8.8.8"
alias restart_network="sudo ifconfig eth0 down && sudo ifconfig eth0 up"
alias externip='curl ifconfig.me'
#alias externip='wget -qO- http://ipecho.net/plain'
alias postfix_clear='sudo postsuper -d ALL'

# git
alias gs="git status"
alias gC="ga . && gc -m "
alias gd="git difftool "
alias gl="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all | tac"
alias ship="gp origin master"
alias gS="gp origin master"
#alias git="hub"
alias gsync='git checkout master && git fetch origin && git pull origin master'
alias gsq='git rebase -i HEAD~2'

# zsh related
alias zcustom="vim $ZSH_CUSTOM/custom.sh"
alias zalias="vim $ZSH_CUSTOM/aliases.sh"
alias zfunctions="vim $ZSH_CUSTOM/functions.sh"

if ! which pbcopy >/dev/null && which xsel >/dev/null; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
fi

