# the main RC file (will be linked to ~/.zshrc)

source $HOME/.config/dot-files/.config/zsh/environment.sh
source $ZSH_CONFIG/lib.sh

start_time="$(date +%s.%N)"

sources=(
  "$ZSH_CONFIG/function.sh"
  "$ZSH_CONFIG/aliases.sh"
)

# Sourced alone because they are brew installations.
# Must ran install script before: `./install.sh homebrew`
source "/opt/homebrew/opt/spaceship/spaceship.zsh"
export STARSHIP_CONFIG=$HOME/.config/dot-files/.config/starship/starship.toml
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

if [ -f "$ZSH_CONFIG/zshrc.local.sh" ]; then
  sources+=("$ZSH_CONFIG/zshrc.local.sh")
fi

for file in "${sources[@]}"; do
  if [ -e "$file" ]; then
    source "$file"
  else
    echo "File not found: $file"
  fi
done

end_time="$(date +%s.%N)"
elapsed_time="$(bc <<<"$end_time-$start_time")"

fancy_echo "zshrc loaded in ${elapsed_time} seconds." "green"
