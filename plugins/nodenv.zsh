#plugin to init pyenv with eval-cache. must come after antigen

if which nodenv > /dev/null; then _evalcache nodenv init -; fi
