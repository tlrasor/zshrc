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

#antigen plugin manager
export ANTIGEN=~/.antigen/
[[ -z $ZSH_CUSTOM ]] && ZSH_CUSTOM=$(dirname $(readlink ~/.zshrc))
source $ZSH_CUSTOM/bootstrap.zsh

#use brew provided utils
COREUTILSPATH=$(brew --prefix coreutils)/libexec/gnubin
PATH=$COREUTILSPATH:$PATH

#ruby
eval "$(rbenv init -)"

#pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export PYENV_ROOT=$(brew --prefix pyenv)

#add ~/bin to path
PATH=$PATH:$HOME/bin 

#fzf fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/travis/.gvm/bin/gvm-init.sh" ]] && source "/Users/travis/.gvm/bin/gvm-init.sh"

