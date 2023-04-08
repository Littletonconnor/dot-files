# the main RC file (will be linked to ~/.zshrc)

source $HOME/zshrc/environment.sh
source $HOME/zshrc/lib.sh

start_time="$(date +%s.%N)"

sources=(
  "$ZSH_CONFIG/function.sh"
  "$ZSH_CONFIG/aliases.sh"
  "$ZSH_CONFIG/private.sh"
  "$ZSH_CONFIG/work.sh"
  # Plugins
  "$ZSH_CONFIG/plugins/.fzf.zsh"
  "$ZSH_CONFIG/plugins/z.sh"
  "$ZSH_CONFIG/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "$ZSH_CONFIG/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  # Theme
  "$ZSH_CONFIG/themes/spaceship/spaceship.zsh-theme"
)

for file in "${sources[@]}"
do
    if [ -e "$file" ]; then
        source "$file"
    else
        echo "File not found: $file"
    fi
done

end_time="$(date +%s.%N)"
elapsed_time="$(bc <<<"$end_time-$start_time")"

fancy_echo "zshrc loaded in ${elapsed_time} seconds." "green"
