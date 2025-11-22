source "$HOME/.config/zsh/environment.sh"
source "$ZSH_CONFIG"/lib.sh

start_time="$(date +%s.%N)"

sources=(
  "$ZSH_CONFIG/function.sh"
  "$ZSH_CONFIG/aliases.sh"
  "$ZSH_CONFIG/initializers.sh"
)

if [ -f "$ZSH_CONFIG/zshrc.work.sh" ]; then
  sources+=("$ZSH_CONFIG/zshrc.work.sh")
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
