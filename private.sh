# Local user stuff

# Disable the annoying bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Override some spaceship settings I don't like
SPACESHIP_RUBY_SHOW=false
SPACESHIP_JAVA_SHOW=false

# setup pnpm
export PNPM_HOME="/Users/connorlittleton/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac