#plugin to init rbenv with eval-cache. must come after antigen

# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which rbenv > /dev/null; then _evalcache rbenv init - zsh; fi
