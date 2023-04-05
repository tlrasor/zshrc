[[ ! -f "$ANTIGEN" ]] && echo 'Could not find $ANTIGEN -- export ANTIGEN=(path to antigen)' && exit 1

# Load antigen library
source "${ANTIGEN}"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh


export NVM_LAZY_LOAD=true

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
    bundler
    command-not-found
    dotenv
    gitfast
    jimhester/per-directory-history
    mroth/evalcache 
    unixorn/autoupdate-antigen.zshplugin
    voronkovich/gitignore.plugin.zsh

EOBUNDLES

if [[ $OSTYPE == 'darwin'* ]]; then
    antigen theme apple

else
    antigen theme cloud
fi

antigen apply

