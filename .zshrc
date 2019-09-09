export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH="/Users/$LOGNAME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

plugins=(git brew npm zsh-syntax-highlighting)

plugins=(fasd)


# JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="/opt/local/bin:$PATH"
export PATH=${JAVA_HOME}/bin:$PATH

source $ZSH/oh-my-zsh.sh

# ======================================================================
# ===================     ALIASES     ==================================
# ======================================================================

# ============
# vim aliases
# ============
alias vi="vim"
alias vim="nvim"
# ============

# ============
# tmux aliases
# ============
alias tmux="tmux -2"
# ============

# ============
# others
# ============
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias lh="ls -d .*"
alias ip="ifconfig | grep 192"
alias mux="tmuxinator"
alias fh-dump="MONGO_R_PASSWORD=Yp42hveNU95n5GsC bin/dump_data_graph.rb production development"
# ============

# ============
# react-native aliases
# ============
alias rn6='react-native run-ios'
alias rna='react-native run-android'
# ============

#==== hosting Dir ===
alias hostDir='ip && python -m SimpleHTTPServer'

# ======================================================================
# ===================     ALIASES-END     ==============================
# ======================================================================

# set VI mode
set -o vi

# 10ms timeout for key sequences
KEYTIMEOUT=1

# source ~/.bin/tmuxinator.zsh
export VISUAL=nvim
export EDITOR="$VISUAL"
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH="$PATH:${HOME}/flutter/bin"

# ctrl + r in vim mode in shell
bindkey '^r' history-incremental-search-backward

export NVM_DIR="/Users/$LOGNAME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# completions
fpath=(/usr/local/share/zsh-completions $fpath)


#initialize Z (https://github.com/rupa/z) 
. ~/z.sh 

export PATH=/usr/local/mysql/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export NPM_TOKEN=a5f86bda-e402-4913-9f85-8ecf3d66a63b

# FZF ripgrep default for vim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
