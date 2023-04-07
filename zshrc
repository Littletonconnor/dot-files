# the main RC file (will be linked to ~/.zshrc)

source $HOME/zshrc/environment.sh

echo "Loading zshrc..."

sources=(
  "$ZSH_CONFIG/function.sh"
  "$ZSH_CONFIG/aliases.sh"
  "$ZSH_CONFIG/private.sh"
  "$ZSH_CONFIG/work.sh"
  "$ZSH_CONFIG/.oh-my-zsh.zsh"
  "$ZSH_CONFIG/.fzf.zsh"
)

for file in "${sources[@]}"
do
    if [ -e "$file" ]; then
        source "$file"
    else
        echo "File not found: $file"
    fi
done

echo "zshrc loaded."
