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

<<<<<<< Updated upstream
function acp() {
  # Usage: acp "commit message"
  git add .
  git commit -m "$1"
  git push origin HEAD
||||||| Stash base
# Function to create notes in TIL or ONCALL directories
notes() {
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
        vim "$file_path"
      fi
      ;;
    "ONCALL")
      # Define the directory for ONCALL notes
      local oncall_dir=~/Sites/notes/on-call

      # Create the directory if it doesn't exist
      mkdir -p "$oncall_dir"

      # Prompt the user for the file name
      read -rp "📝 Enter the name of the ONCALL note: " filename

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
        vim "$file_path"
      fi
      ;;
    *)
      echo "❌ Invalid option selected. Please choose 1 or 2."
      ;;
    esac
    # Exit the select loop after handling the option
    break
  done
=======
# Function to create notes in TIL or ONCALL directories
notes() {
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
>>>>>>> Stashed changes
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
  git branch --merged | grep -e -v "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | grep -e -v "(^\*|master|main|dev)" | xargs git branch -D
}

function curlheaders() {
  # Usage: curlHeaders https://google.com
  curl -I -L --max-redirs 0 "$1"
}

function curlallheaders() {
  # Usage: curlAllHeaders https://google.com
  # Usage with http: http --follow --headers wealthfront.com
  curl curl -sIL "$1"
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
