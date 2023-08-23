source $HOME/zshrc/lib.sh

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # GIT FUNCTIONS # # # # # # # # #  
# # # # # # # # # # # # # # # # # # # # # # # # # # #
function acp() {
  git add .
  git commit -m "$1"
  git push origin HEAD
}

function mpb() {
  git checkout master
  git pull origin master
  git checkout -
}

function glog () {
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --decorate
}

function grecentchanges () {
  git ls-tree -r --name-only HEAD "$1" | while read file; do echo "$(git log -1 --pretty=format:"%ad %h %an: %s" --date=format:'%Y-%m-%d' -- $file) $file"; done | sort -k1,1 -k2,2
}

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # OTHER FUNCTIONS # # # # # # # # #  
# # # # # # # # # # # # # # # # # # # # # # # # # # #

function getip {
    curl -sL icanhazip.com
}

function usedports {
  lsof -i -P -n | grep LISTEN
}

function curlHeaders () {
  # Usage: curlHeaders https://google.com
  curl -I -L --max-redirs 0 "$1"
}

function curlAllHeaders () {
  # Usage: curlAllHeaders https://google.com
  curl curl -sIL "$1"
}

function curlStatusCode () {
  # Usage: curlStatusCode https://google.com
  curl -I -s -o /dev/null -w '%{http_code}\n' "$1"
}

function npm_benchmark () {
  # Example usage:
  # npm_benchmark 10 "test --silent"

  local num_attempts="$1"
  shift
  local test_command="$*"
  local total_elapsed_time=0

  for ((i = 1; i <= num_attempts; i++)); do
    echo "Running test attempt $i"
    
    start_time="$(date +%s.%N)"
    npm run $test_command
    exit_status=$?
    end_time="$(date +%s.%N)"
    
    elapsed_time="$(bc <<<"$end_time-$start_time")"
    total_elapsed_time=$(bc <<<"$total_elapsed_time+$elapsed_time")
    fancy_echo "Test attempt $i took $elapsed_time s" "green"
    
    if [[ "$exit_status" != 0 ]]; then
      fancy_echo "Failed after $i attempts" "red"
      break
    fi
  done

  local average_elapsed_time=$(bc <<<"scale=6;$total_elapsed_time/($num_attempts)")
  fancy_echo "Average runtime: $average_elapsed_time s" "yellow"
}

function checkCores () {
  # Check the number of CPU cored on MacOs or Linux.
  sysctl -n hw.logicalcpu
}

function checkRam () {
  # Check the amount of RAM on MacOs or Linux (bytes).
  sysctl hw.memsize | awk '{print $2/1073741824 " GB"}'
}

cleanBranches() {
  # Remove all merge and non-merged branches locally except master and dev.
  git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -D
}