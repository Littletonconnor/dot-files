function toggle_kitty_transparency() {
  sh ~/.config/kitty/toggle-transparency.sh
}

function acp() {
  # Usage: acp "commit message"
  git add .
  git commit -m "$1"
  git push origin HEAD
}

function findlargefiles() {
  # Find files larger than 5MB in a directory.
  # du -sh *
  # du -h --max-depth=1 | sort -hr
  find "$1" -type f -size +5M -exec du -h {} + | sort -rh
}

function grecentchanges() {
  git ls-tree -r --name-only HEAD "$1" | while read file; do echo "$(git log -1 --pretty=format:"%ad %h %an: %s" --date=format:'%Y-%m-%d' -- $file) $file"; done | sort -k1,1 -k2,2
}

function cleanbranches() {
  # Remove all merge and non-merged branches locally except master and dev.
  git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -D
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
  cd ~/Sites/santafe/
  ./t $1
  cd -
}

function checkcores() {
  # Check the number of CPU cored on MacOs or Linux.
  sysctl -n hw.logicalcpu
}

function checkram() {
  # Check the amount of RAM on MacOs or Linux (bytes).
  sysctl hw.memsize | awk '{print $2/1073741824 " GB"}'
}

function copyfile() {
  pbcopy <"$1"
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
  kill -9 $(lsof -t -i:$1)
}

function resize() {
  # magick ~/Desktop/test.png -resize 650x ~/Desktop/test.png
  magick "$1" -resize 650x "$1"
}

function untar() {
  # Usage: untar file.tar.gz
  tar -xvzf "$1"
}

function humanreadablepath() {
  echo $PATH | tr ':' '\n'
}

function sync_configs() {
  rsync -av --delete ~/.config/dot-files/.config/nvim/* /.config/
  rsync -av --delete ~/.config/dot-files/.config/starship/* /.config/
  rsync -av --delete ~/.config/dot-files/.config/tmux/* /.config/
  rsync -av --delete ~/.config/dot-files/.config/kitty/* /.config/
}
