export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export ZSH="/Users/$LOGNAME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git brew npm fnm)
plugins+=(fasd)
fpath=(/usr/local/share/zsh-completions $fpath)
source $ZSH/oh-my-zsh.sh

export VISUAL=nvim
export EDITOR="$VISUAL"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"
export PATH="/opt/local/bin:$PATH"
export PATH=~/.fzf/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/mysql-8.0.31-macos12-arm64/bin:$PATH
export PATH="/usr/local/go/bin:$PATH"
export PATH="/Users/aakashsigdel/Downloads:$PATH"

# ---
alias ip="ifconfig | grep 192"
alias tmux="tmux -2"
alias zconfig="vim ~/.zshrc"
alias act="act --container-architecture linux/amd64"
alias rg="rg --hidden"

alias vi="vim"
alias vim="nvim"

alias g='git'
alias gs="git status"
alias ga="git add"
alias gl="git log"
alias gcm="git commit -m"
alias gck="git checkout"
alias gpl="git pull origin"

alias y="yarn"
alias yw="yarn workspace"

# ---

set -o vi
bindkey '^r' history-incremental-search-backward

# 10ms timeout for key sequences
KEYTIMEOUT=1

# export NVM_DIR="/Users/$LOGNAME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
#
# nvm alias arm stable
# nvm alias intel 16

#initialize zoxide
eval "$(zoxide init zsh)"

# FZF configs
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# GPG keys
export GPG_TTY=$(tty)

# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"
eval "$(fnm env --use-on-cd)"

# temp flags
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
