# Set up the prompt
autoload -Uz promptinit
promptinit


if [[ $OSTYPE == 'darwin'* ]]; then
  # Use modern completion system
  export FPATH="$(brew --prefix)/share/zsh/site-functions:$FPATH"
  
  #use brew provided utils
  COREUTILSPATH="$(brew --prefix coreutils)/libexec/gnubin"
  PATH=$COREUTILSPATH:$PATH
  PATH=/usr/local/sbin:/usr/local/bin:$PATH

  #add openssl to pkg config
  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig
fi


#get dot files directory
[[ -z $ZSH_CUSTOM ]] && ZSH_CUSTOM=$(dirname $(readlink "${HOME}/.zshrc"))

#bootstrap antigen plugin manager
export ANTIGEN="${HOME}/antigen.zsh"
source $ZSH_CUSTOM/antigen.zsh

#bootstrap zsh custom utils and functions
source $ZSH_CUSTOM/bootstrap.zsh

#add ~/bin to path
export PATH=$PATH:$HOME/bin 


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman" 
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
