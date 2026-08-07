export ZSH_CONFIG="$HOME/.config/zsh"
export DOT_FILES="$HOME/.config/dot-files"
export EDITOR=nvim

# Personal scripts (stow-managed: home/.local/bin -> ~/.local/bin)
export PATH="$HOME/.local/bin:$PATH"

# Disable annoying bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi
