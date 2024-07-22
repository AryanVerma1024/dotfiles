#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.sh/functions ]; then
  source ~/.sh/functions
fi

if [ -f ~/.sh/aliases ]; then
  source ~/.sh/aliases
fi

# xdg
export XDG_CONFIG_HOME=$HOME/.config

# Load oh-my-posh
if check oh-my-posh; then
  if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init bash --config $XDG_CONFIG_HOME/omp/omp_config.toml)"
  fi
else
  PS1='[\u@\h \W]\$ '
fi

# bat
if check bat; then
  export MANPAGER="sh -c 'col -bx | bat -plman'"
  export PAGER="bat"
  export BAT_CONFIG_PATH="$XDG_CONFIG_HOME/bat/config"
fi