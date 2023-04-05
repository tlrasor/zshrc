#plugin to init pyenv with eval-cache. must come after antigen

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then _evalcache pyenv init -; fi

if [[ $OSTYPE == 'darwin'* ]]; then
    #To avoid them accidentally linking against a Pyenv-provided Python
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi