# ============================================================================
# Oh-My-Zsh Configuration
# ============================================================================
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"  # or "agnoster", "refined", etc.
ZSH_DISABLE_COMPFIX="true"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  docker
  docker-compose
)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# History Configuration
# ============================================================================
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY           # Share history between sessions
setopt HIST_IGNORE_DUPS        # Don't save duplicates
setopt HIST_IGNORE_SPACE       # Don't save commands starting with space
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicates first
setopt HIST_FIND_NO_DUPS       # Don't show duplicates in search

# ============================================================================
# Environment Variables
# ============================================================================
export DEFAULT_USER=`whoami`
export EDITOR="nvim"
export SSH_KEY_PATH="~/.ssh/rsa_id"
export BAT_THEME="TwoDark"
export TERM="xterm-256color"

# NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Other paths
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [[ -d "/opt/homebrew/bin" ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# ============================================================================
# Aliases
# ============================================================================

# Editor
alias vi="nvim"
alias vim="nvim"

# Modern command replacements
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons --long --all --group-directories-first'
alias la='eza --icons --long --all --group-directories-first'
alias lt='eza --icons --tree --level=2 --group-directories-first'
alias cat='bat --style=auto'
alias find='fd'
alias grep='rg'

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkd='mkdir -p'

# Claude context helpers
alias cgd='git diff | pbcopy && echo "✓ Git diff copied to clipboard"'
alias cgs='git diff --staged | pbcopy && echo "✓ Staged diff copied to clipboard"'
alias cgl='git log --oneline -10 | pbcopy && echo "✓ Last 10 commits copied to clipboard"'

# Safe file deletion (use trash instead of rm)
alias rm='trash'

# ============================================================================
# Tool Initializations
# ============================================================================

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Rbenv
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Zoxide (smart cd)
if command -v zoxide 1>/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi
