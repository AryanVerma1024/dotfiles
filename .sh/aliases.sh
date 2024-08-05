#!/bin/sh
#
# ~/.sh/aliases
#

# This file contains aliases that are meant to be sourced by ~/.bashrc and ~/.zshrc.

# useful
alias c='clear'
alias less='less -RF'
alias du='du -had1'
alias df='df -h'
alias free='free -m'

alias sn='shutdown now'
alias srn='shutdown -r now'

alias neofetch='fastfetch'

alias mirror='sudo reflector -f 30 -l 30 -n 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector -l 50 -n 20 --sort score --save /etc/pacman.d/mirrorlist'

# nav
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# bat
# if check bat; then
if [ -n "$BAT_BIN" ]; then
  alias cat='$BAT_BIN --style header,snip,changes'
  # bat help
  bh() {
    "$@" --help 2>&1 | $BAT_BIN -pl help
  }
fi

# eza || ls
if check eza; then
  alias ls='eza'
  alias la='eza -a'
  alias ll='eza -l'
  alias lla='eza -la'
  alias l='eza -F'

  # tree
  alias tree='eza -T --git-ignore --icons -I ".git|node_modules|.cache"'
else
  alias ls='ls --color=auto'
  alias la='ls --color=auto -A'
  alias ll='ls --color=auto -lh'
  alias lla='ls --color=auto -lah'
  alias l='ls --color=auto -CF'
fi

# ripgrep || grep
if check rg; then
  alias grep='rg'
else
  alias grep='grep --color=auto'
fi

# fd
if check fd; then
  alias fd='fd --hidden -E .git -E node_modules -E .cache'
fi

# tre
if check tre; then
  alias tre='tre -E "(.git(?!ignore|modules)|node_modules|cache)"'
fi