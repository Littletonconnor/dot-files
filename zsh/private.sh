# Local user stuff

# Disable the annoying bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Override some spaceship settings I don't like
SPACESHIP_RUBY_SHOW=false
SPACESHIP_JAVA_SHOW=false

# Added by nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/connorlittleton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end