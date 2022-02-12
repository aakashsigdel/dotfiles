export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH="/Users/$LOGNAME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git brew npm)
plugins+=(fasd)
fpath=(/usr/local/share/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh

export VISUAL=nvim
export EDITOR="$VISUAL"
export ANDROID_HOME=${HOME}/Library/Android/sdk
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/Contents/Home
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="/opt/local/bin:$PATH"
export PATH=${JAVA_HOME}/bin:$PATH
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH=/Library/PostgreSQL/14/bin:$PATH
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=~/.fzf/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH

alias vi="vim"
alias vim="nvim"
alias ip="ifconfig | grep 192"


set -o vi
bindkey '^r' history-incremental-search-backward

# 10ms timeout for key sequences
KEYTIMEOUT=1

export NVM_DIR="/Users/$LOGNAME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#initialize Z (https://github.com/rupa/z) 
. ~/z.sh

# FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# GPG keys
export GPG_TTY=$(tty)
