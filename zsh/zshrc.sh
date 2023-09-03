# the main RC file (will be linked to ~/.zshrc)

source $HOME/.config/dot-files/zsh/environment.sh
source $ZSH_CONFIG/lib.sh

start_time="$(date +%s.%N)"

sources=(
  "$ZSH_CONFIG/function.sh"
  "$ZSH_CONFIG/aliases.sh"
  "$ZSH_CONFIG/private.sh"
)

# Source by itself and suppress SPACHEHIP_ROOT warning
# Theme (must run setup script first. ./install.sh homebrew)
source $HOMEBREW_PREFIX/opt/spaceship/spaceship.zsh 2>/dev/null
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if [ -f "$ZSH_CONFIG/work.sh" ]; then
  sources+=("$ZSH_CONFIG/work.sh")
fi

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
