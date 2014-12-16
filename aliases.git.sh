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

alias gf='git flow'