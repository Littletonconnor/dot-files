export ZSH_CONFIG="$HOME/.config/dot-files/.config/zsh"
export DOT_FILES="$HOME/.config/dot-files/.config"
export EDITOR=nvim
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# Disable annoying bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi
