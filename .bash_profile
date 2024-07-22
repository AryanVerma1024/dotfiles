#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && source ~/.bashrc

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Load oh-my-posh
if [ -z "$TERM_PROGRAM" ] || [ "$TERM_PROGRAM" != "WarpTerminal" ]; then
    eval "$(oh-my-posh init bash --config ~/.config/omp/omp_config.toml)"
fi

PATH=~/.console-ninja/.bin:$PATH
