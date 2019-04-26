auto-color-ls() {
    emulate -L zsh
    colorls --color=auto --light -A --git-status --group-directories-first
}

chpwd_functions=(auto-color-ls $chpwd_functions)
