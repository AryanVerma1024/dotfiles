#!/bin/zsh

# Brew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Set zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if not present
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Catppuccin for zsh-syntax-highlighting
source ~/.sh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
# zinit snippet OMZP::alias-finder
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load Plugins
autoload -U compinit && compinit

zinit cdreplay -q

# Load oh-my-posh
if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init zsh --config ~/.config/omp/omp_config.toml)"
fi

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=50000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Functions
if [ -f ~/.sh/functions ]; then source ~/.sh/functions; fi

# Exports
if [ -f ~/.sh/exports ]; then source ~/.sh/exports; fi

# Aliases
if [ -f ~/.sh/aliases ]; then source ~/.sh/aliases; fi

# Shell integrations
if check fzf; then eval "$(fzf --zsh)"; fi
if check zoxide; then eval "$(zoxide init --cmd cd zsh)"; fi

# nvm
if [ -f /usr/share/nvm/init-nvm.sh ]; then
  source /usr/share/nvm/init-nvm.sh
fi
