# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Install zoxide
eval "$(zoxide init zsh)"

# Go (run brew install goenv first)
eval "$(goenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PNPM
export PNPM_HOME="/Users/connorlittleton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
