# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

HISTFILE=~/.zsh_history     # Where your history is written
HISTSIZE=10000              # How many commands to keep in RAM
SAVEHIST=10000              # How many commands to save to HISTFILE
setopt VI                   # Set vi mode
setopt share_history        # Share history across all running zsh sessions
setopt inc_append_history   # Immediately append every command to the history file
setopt hist_ignore_all_dups # Don't record an entry that is already in the history
setopt hist_reduce_blanks   # Remove superfluous blanks before saving

# Initialize Zoxide
eval "$(zoxide init zsh)"

# Initialize GO
eval "$(goenv init -)"

# Initialize Starship
eval "$(starship init zsh)"
# Annoying starship_zle-keymap-select-wrapped error in vi mode
unfunction starship_zle-keymap-select-wrapped

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
