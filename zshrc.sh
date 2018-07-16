# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

#antigen plugin manager
export ANTIGEN=~/.antigen
[[ -z $ZSH_CUSTOM ]] && ZSH_CUSTOM=$(dirname $(readlink ~/.zshrc))
source $ZSH_CUSTOM/bootstrap.zsh

#use brew provided utils
COREUTILSPATH=$(brew --prefix coreutils)/libexec/gnubin
PATH=$COREUTILSPATH:$PATH
PATH=/usr/local/sbin:/usr/local/bin:$PATH

#rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
#PYENV_VERSION="2.7.11 3.5.1"
pyenv global 2.7.11 3.5.1

#add ~/bin to path
PATH=$PATH:$HOME/bin 

#lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi
  
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/travis/.sdkman" 
[[ -s "/Users/travis/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/travis/.sdkman/bin/sdkman-init.sh"
