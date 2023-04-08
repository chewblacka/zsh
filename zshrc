# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#################### PATH ####################  
path+=/home/$USER/bin

#################### Env Vars ####################  
# export MERGE=vimdiff

#################### Aliases ####################  
source $HOME/.alias


################################################
################ LOAD ANTIGEN  #################
################################################  
# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load



# agkozak/zsh-z options
ZSHZ_EXCLUDE_DIRS=($HOME/temp)
ZSHZ_NO_RESOLVE_SYMLINKS=1
ZSHZ_DATA=$ZDOTDIR/.z



################################################
################### HISTORY ####################
################################################  

# Set history file otherwise defaults to ~/.zsh_history
HISTFILE=$ZDOTDIR/.zsh_history
HISTSIZE=999999 # HISTSIZE tells you how many entries to load into ram
SAVEHIST=800000 # SAVEHIST tells you how big to keep hist file

# Ignore commands for history
HISTORY_IGNORE='(ll|exit|whoami)'

# Unset oh-my-zsh's option to share history across sessions
unsetopt share_history

# histdb
source "$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-larkery-SLASH-zsh-histdb/sqlite-history.zsh"
autoload -Uz add-zsh-hook



###################################################
#################### CTRL KEYS ####################
###################################################  

# zsh-users/zsh-history-substring-search
# Crtl-j and Ctrk-k do substring search (port from Fish shell)
bindkey '^k' history-substring-search-up
bindkey '^j' history-substring-search-down

# Edit line in vim with Ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


################### P10K  #########################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/$ZDOTDIR/.p10k.zsh ]] || source ~/$ZDOTDIR/.p10k.zsh

################### direnv ########################
eval "$(direnv hook zsh)"





