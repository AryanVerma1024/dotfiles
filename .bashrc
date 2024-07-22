#!/bin/bash
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f ~/.sh/functions ]; then source ~/.sh/functions; fi
if [ -f ~/.sh/aliases ]; then source ~/.sh/aliases; fi
if [ -f ~/.sh/exports ]; then source ~/.sh/exports; fi

export SHELL=/bin/bash

shopt -s histappend checkwinsize expand_aliases
set +o noclobber

# Brew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]] then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Load oh-my-posh
if check oh-my-posh; then
  if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init bash --config "$XDG_CONFIG_HOME/omp/omp_config.toml")"
  fi
else
  PS1='[\u@\h \W]\$ '
fi

# Bash completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

# Keybindings
bind '"\C-p": history-search-backward'
bind '"\C-n": history-search-forward'

# fzf
if check fzf; then eval "$(fzf --bash)"; fi

# zoxide
if check zoxide; then eval "$(zoxide init --cmd cd bash)"; fi