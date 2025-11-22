# fvim -> find and open a file in vim
function fvim() {
  if [[ $# -eq 0 ]]; then
    fd -t f | fzf --header "Open File in Vim" --preview "cat {}" | xargs nvim
  else
    fd -t f | fzf --header "Open File in Vim" --preview "cat {}" -q "$@" | xargs nvim
  fi
}

function dbuddy() {
  # Combine directories from ~/Sites and ~/.config
  TARGET_DIR=$(ls -d ~/Sites/*/ ~/.config/*/ 2>/dev/null | fzf --prompt="Select a directory: ")

  # If a directory was selected, navigate to it
  if [ -n "$TARGET_DIR" ]; then
    cd "$TARGET_DIR" || exit
  else
    echo "No directory selected."
  fi
}

function tbuddy() {
  if [[ $# -eq 1 ]]; then
    selected=$1
  else
    selected=$(find ~/Sites ~/personal ~/ -mindepth 1 -maxdepth 1 -type d | fzf)
  fi

  if [[ -z $selected ]]; then
    exit 0
  fi

  selected_name=$(basename "$selected" | tr . _)
  tmux_running=$(pgrep tmux)

  if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
  fi

  if ! tmux has-session -t=$selected_name 2>/dev/null; then
    tmux new-session -ds $selected_name -c $selected
  fi

  if [[ -z $TMUX ]]; then
    # Attach to the session if not in tmux
    tmux attach-session -t $selected_name
  else
    # Switch client if already in tmux
    tmux switch-client -t $selected_name
  fi
}

function findlargefiles() {
  # Find files larger than 5MB in a directory.
  # du -sh *
  # du -h -d 1 | sort -hrb
  find "$1" -type f -size +5M -exec du -h {} + | sort -rh
}

function grecentchanges() {
  git ls-tree -r --name-only HEAD "$1" | while read file; do echo "$(git log -1 --pretty=format:"%ad %h %an: %s" --date=format:'%Y-%m-%d' -- "$file") $file"; done | sort -k1,1 -k2,2
}

function gitlog() {
  git log -n 20 --pretty=format:"%h %ad %s" --date=short "$1"
}

function cleanbranches() {
  # Remove all merge and non-merged branches locally except master and dev.
  git branch --merged | grep -e "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | grep -e "(^\*|master|main|dev)" | xargs git branch -D
}

function getip {
  curl -sL icanhazip.com
}

function usedports {
  lsof -i -P -n | grep LISTEN
}

function test() {
  cd ~/Sites/santafe/ || exit
  ./t "$1"
  cd - || exit
}

function checkcores() {
  # Check the number of CPU cored on MacOs or Linux.
  sysctl -n hw.logicalcpu
}

function checkram() {
  # Check the amount of RAM on MacOs or Linux (bytes).
  sysctl hw.memsize | awk '{print $2/1073741824 " GB"}'
}

function tobytes() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <number> <unit>"
    exit 1
  fi

  number=$1
  unit=$2

  case "$unit" in
  KB)
    result=$(echo "$number * 1024" | bc)
    echo "$number KB is $result Bytes"
    ;;
  MB)
    result=$(echo "$number * 1024 * 1024" | bc)
    echo "$number MB is $result Bytes"
    ;;
  GB)
    result=$(echo "$number * 1024 * 1024 * 1024" | bc)
    echo "$number GB is $result Bytes"
    ;;
  *)
    echo "Invalid unit. Please use 'KB', 'MB', or 'GB'."
    ;;
  esac
}

function ip_location() {
  curl https://ipinfo.io/"$1"
}

function kill_port() {
  # Usage: kill_port 2019 -> kills process running on port 2019 `caddy`
  kill -9 $(lsof -t -i:"$1")
}

function untar() {
  # Usage: untar file.tar.gz
  tar -xvzf "$1"
}

function humanreadablepath() {
  echo "$PATH" | tr ':' '\n'
}
