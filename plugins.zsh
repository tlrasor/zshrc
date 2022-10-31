auto-color-ls() {
    emulate -L zsh
    lsd  -A --color=auto --group-dirs=first
}

chpwd_functions=(auto-color-ls $chpwd_functions)
