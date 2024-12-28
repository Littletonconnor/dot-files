# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize Zoxide
eval "$(zoxide init zsh)"

# Initialize GO
eval "$(goenv init -)"

# Initialize Starship
eval "$(starship init zsh)"

# JAVA / RUBY STUFF
export JAVA_HOME=$(/usr/libexec/java_home)

# Nvm equivalent for ruby versioning
eval "$(rbenv init - zsh)"

# NVM STUFF
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# PNPM
export PNPM_HOME="/Users/connorlittleton/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
