HISTFILE=~/.zsh_history     # Where your history is written
HISTSIZE=10000              # How many commands to keep in RAM
SAVEHIST=10000              # How many commands to save to HISTFILE
setopt share_history        # Share history across all running zsh sessions
setopt inc_append_history   # Immediately append every command to the history file
setopt hist_ignore_all_dups # Don't record an entry that is already in the history
setopt hist_reduce_blanks   # Remove superfluous blanks before saving

# ZSH AUTOSUGGETIONS
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize Zoxide
eval "$(zoxide init zsh)"

# Initialize GO
eval "$(goenv init -)"

# bun completions
[ -s "/Users/connorlittleton/.bun/_bun" ] && source "/Users/connorlittleton/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# STARSHIP
eval "$(starship init zsh)"

# RBENV
eval "$(rbenv init - zsh)"

# PNPM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# PNPM
export PNPM_HOME="/Users/connorlittleton/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# JENV - Java version management (must be after other PATH modifications)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
