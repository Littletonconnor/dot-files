# fvim -> find and open a file in vim
function fvim() {
  if [[ $# -eq 0 ]]; then
    fd -t f | fzf --header "Open File in Vim" --preview "cat {}" | xargs nvim
  else
    fd -t f | fzf --header "Open File in Vim" --preview "cat {}" -q "$@" | xargs nvim
  fi
}

function dir-buddy() {
  # Combine directories from ~/Sites and ~/.config
  TARGET_DIR=$(ls -d ~/Sites/*/ ~/.config/*/ 2>/dev/null | fzf --prompt="Select a directory: ")

  # If a directory was selected, navigate to it
  if [ -n "$TARGET_DIR" ]; then
    cd "$TARGET_DIR" || exit
  else
    echo "No directory selected."
  fi
}

function tmux-buddy() {
  # Define the choices (renamed from "options" to "buddy_options")
  local buddy_options=$'tmux-sessionizer\ntmux-programming\ntmux-oncall'

  # Use fzf to select an option
  local selected
  selected=$(echo "$buddy_options" | fzf --prompt="Select a tmux session: ")

  # Check the selection and call the corresponding function
  case "$selected" in
  tmux-sessionizer)
    tmux_sessionizer
    ;;
  tmux-programming)
    tmux_programming
    ;;
  tmux-oncall)
    tmux_oncall
    ;;
  *)
    echo "Invalid selection or cancelled."
    ;;
  esac
}

function tmux_sessionizer() {
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

function tmux_programming() {
  local session_name="programming"
  local project_dir="$HOME/Sites/santafe"

  # If the session already exists, just attach (or switch if you're inside tmux)
  if tmux has-session -t "$session_name" 2>/dev/null; then
    if [ -n "$TMUX" ]; then
      tmux switch-client -t "$session_name"
    else
      tmux attach-session -t "$session_name"
    fi
    return
  fi

  ##################################################################
  # 1) Create a new session (detached) – starts with window index 0
  ##################################################################
  tmux new-session -d -s "$session_name" -c "$project_dir"

  ##################################################################
  # 2) Set base-index (and pane-base-index) to 1 *for this session*
  ##################################################################
  tmux set-option -t "$session_name" base-index 1
  tmux set-option -t "$session_name" pane-base-index 1

  ##################################################################
  # 3) Create the "Editor" window at index 1 and run `nvim .`
  ##################################################################
  tmux new-window -t "$session_name:1" -n "Editor" -c "$project_dir"
  tmux send-keys -t "$session_name:1" "nvim ." C-m

  ##################################################################
  # 4) Create the "Shell" window at index 2
  ##################################################################
  tmux new-window -t "$session_name:2" -n "Shell" -c "$project_dir"

  ##################################################################
  # 5) Create the "Split" window at index 3, then split into 4 panes
  ##################################################################
  tmux new-window -t "$session_name:3" -n "Split" -c "$project_dir"
  tmux split-window -t "$session_name:3" -h -c "$project_dir"
  tmux split-window -t "$session_name:3" -v -c "$project_dir"
  tmux select-pane -t "$session_name:3"
  tmux split-window -t "$session_name:3" -v -c "$project_dir"
  tmux select-layout -t "$session_name:3" tiled

  ##################################################################
  # 7) Focus back on window 1 (Editor) and attach
  ##################################################################
  tmux select-window -t "$session_name:1"

  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
  else
    tmux attach-session -t "$session_name"
  fi
}

function tmux_programming() {
  local session_name="programming"
  local project_dir="$HOME/Sites/santafe"

  # If the session already exists, just attach to it
  if tmux has-session -t "$session_name" 2>/dev/null; then
    echo "Session '$session_name' already exists. Attaching..."
    tmux attach-session -t "$session_name"
    return
  fi

  # 1) Create a new detached session with an "Editor" window
  tmux new-session -d -s "$session_name" -c "$project_dir" -n "Editor"
  tmux send-keys -t "$session_name:0" "nvim ." C-m

  # 2) Create a "Shell" window
  tmux new-window -t "$session_name:1" -c "$project_dir" -n "Shell"

  # 3) Create a "Split" window with four panes
  tmux new-window -t "$session_name:2" -c "$project_dir" -n "Split"
  tmux split-window -t "$session_name:2" -h -c "$project_dir"
  tmux split-window -t "$session_name:2" -v -c "$project_dir"
  tmux select-pane -t "$session_name:2.0"
  tmux split-window -t "$session_name:2" -v -c "$project_dir"
  tmux select-layout -t "$session_name:2" tiled

  # 4) Switch back to the "Editor" window so you're in nvim upon attach
  tmux select-window -t "$session_name:0"

  # 5) Finally, attach to the session
  tmux attach-session -t "$session_name"
}

function tmux_oncall() {
  session_name="oncall"

  if ! tmux has-session -t $session_name 2>/dev/null; then
    # Create the session and Tab 1
    tmux new-session -ds $session_name -c ~

    # Tab 2
    tmux new-window -t $session_name:1 -c ~

    # Tab 3
    tmux new-window -t $session_name:2 -c ~

    # Tab 4
    tmux new-window -t $session_name:3 -c ~

    # Tab 5
    tmux new-window -t $session_name:4 -c ~
  fi

  tmux attach-session -t $session_name
}

# Function to create notes in TIL or ONCALL directories
function notes() {
  # Define the options
  local options=("TIL" "ONCALL")

  # Prompt the user to select an option
  echo "Select the type of note to create:"
  select opt in "${options[@]}"; do
    case $opt in
    "TIL")
      # Define the directory for TIL notes
      local til_dir=~/Sites/notes/til

      # Create the directory if it doesn't exist
      mkdir -p "$til_dir"

      # Get the current date in YYYY-MM-DD format
      local current_date=$(date +"%Y-%m-%d")

      # Define the file path
      local file_path="$til_dir/${current_date}.md"

      # Check if the file already exists
      if [[ -e "$file_path" ]]; then
        echo "❗ A TIL note for today already exists: $file_path"
      else
        # Create the Markdown file
        touch "$file_path"
        echo "✅ Created TIL note: $file_path"

        # Open the file in your default editor
        nvim "$file_path"
      fi
      ;;
    "ONCALL")
      # Define the directory for ONCALL notes
      local oncall_dir=~/Sites/notes/on-call

      # Create the directory if it doesn't exist
      mkdir -p "$oncall_dir"

      # Prompt the user for the file name
      read "filename?📝 Enter the name of the ONCALL note: "

      # Sanitize the filename: replace spaces with dashes
      filename=${filename// /-}

      # Ensure the filename ends with .md
      if [[ "$filename" != *.md ]]; then
        filename="${filename}.md"
      fi

      # Define the file path
      local file_path="$oncall_dir/$filename"

      # Check if the file already exists
      if [[ -e "$file_path" ]]; then
        echo "❗ An ONCALL note named '$filename' already exists: $file_path"
      else
        # Create the Markdown file
        touch "$file_path"
        echo "✅ Created ONCALL note: $file_path"

        # Open the file in your default editor
        nvim "$file_path"
      fi
      ;;
    *)
      echo "❌ Invalid option selected. Please choose 1 or 2."
      ;;
    esac
    # Exit the select loop after handling the option
    break
  done
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
  git log -n 5 --pretty=format:"%h %ad %s" --date=short "$1"
}

function cleanbranches() {
  # Remove all merge and non-merged branches locally except master and dev.
  git branch --merged | grep -e "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | grep -e "(^\*|master|main|dev)" | xargs git branch -D
}

function curlheaders() {
  # Usage: curlHeaders https://google.com
  curl -I -L --max-redirs 0 "$1"
}

function curlallheaders() {
  # Usage: curlAllHeaders https://google.com
  # Usage with http: http --follow --headers wealthfront.com
  curl -sIL "$1"
}

function curlstatuscode() {
  # Usage: curlStatusCode https://google.com
  curl -I -s -o /dev/null -w '%{http_code}\n' "$1"
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

function sync_configs() {
  rsync -av --delete ~/.config/dot-files/.config/nvim/ ~/.config/nvim
  rsync -av --delete ~/.config/dot-files/.config/starship/ ~/.config/starship
  rsync -av --delete ~/.config/dot-files/.config/tmux/ ~/.config/tmux
  rsync -av --delete ~/.config/dot-files/.config/kitty/ ~/.config/kitty
}
