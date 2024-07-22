#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

alias ls='ls --color=auto'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -lh'
alias lla='ls --color=auto -lAh'
alias grep='grep --color=auto'
alias neofetch='fastfetch'

# Load oh-my-posh
if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init bash --config ~/.config/omp/omp_config.toml)"
fi

PATH=~/.console-ninja/.bin:$PATH
