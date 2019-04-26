[[ -z $ANTIGEN ]] && echo 'export ANTIGEN=(path to antigen)' && return 1

export HISTORY_BASE=~/.config/directory_history
export CDL_LS_PARAMS='-l'
#export IFS=$'\n'

# Fix default zstyle for tab completion
zstyle ':completion:*' format ''
zstyle ':completion:*' menu select auto

# Load antigen library
source $ANTIGEN/antigen.zsh
source $ZSH_CUSTOM/.antigenrc

# Load zsh custom sources
source $ZSH_CUSTOM/utils.zsh

load "plugins.*.zsh" "$ZSH_CUSTOM" # sources custom plugins 
load "exports.*.sh" "$ZSH_CUSTOM" # sources any export files for env variables
load "functions.*.zsh" "$ZSH_CUSTOM" # sources any local functions files (functions.local.sh)
load "aliases.*.sh" "$ZSH_CUSTOM"    # sources all aliases files
