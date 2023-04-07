# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/connorlittleton/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/connorlittleton/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/connorlittleton/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/connorlittleton/.fzf/shell/key-bindings.zsh"
