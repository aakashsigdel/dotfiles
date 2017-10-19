export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH=/Users/aakash/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew npm zsh-syntax-highlighting)

plugins=(fasd)



# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/opt/local/bin:$PATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"


# ======================================================================
# ===================     ALIASES     ==================================
# ======================================================================

# ============
# vim aliases
# ============
alias vi="nvim"
# alias vim="nvim"
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

# ======================================================================
# ===================     ALIASES-END     ==============================
# ======================================================================

# set VI mode
set -o vi

# 10ms timeout for key sequences
KEYTIMEOUT=1

source ~/.bin/tmuxinator.zsh
export EDITOR=nvim
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

# ctrl + r in vim mode in shell
bindkey '^r' history-incremental-search-backward

export NVM_DIR="/Users/aakash/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# completions
fpath=(/usr/local/share/zsh-completions $fpath)

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"


#initialize Z (https://github.com/rupa/z) 
. ~/z.sh 

export PATH=/usr/local/mysql/bin:$PATH
