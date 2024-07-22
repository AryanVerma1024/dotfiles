#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ -f ~/.sh/.aliases ]; then
    source ~/.sh/.aliases
fi

# Load oh-my-posh
if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init bash --config ~/.config/omp/omp_config.toml)"
fi

PATH=~/.console-ninja/.bin:$PATH
