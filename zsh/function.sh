source $HOME/.config/dot-files/zsh/lib.sh
# fvim -> find and open a file in vim
function fvim() {
    if [[ $# -eq 0 ]]; then
        fd -t f | fzf --header "Open File in Vim" --preview "cat {}" | xargs nvim
    else
        fd -t f | fzf --header "Open File in Vim" --preview "cat {}" -q "$@" | xargs nvim
    fi
}

# vim -> open vim in the current directory or open the target file
function vim() {
    if [[ $# -eq 0 ]]; then
        nvim .
    else
        nvim "$@"
    fi
}

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # GIT FUNCTIONS # # # # # # # # #  
# # # # # # # # # # # # # # # # # # # # # # # # # # #
function acp() {
  # Usage: acp "commit message"
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
  # Usage: glog
  git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --decorate
}

function printpackages () {
  tree -L 2 -P 'apps|packages|configs' -I 'node_modules|script|tools|githooks|vendor|app|.git'
}

function findlargefiles () {
  # Find files larger than 5MB in a directory.
  # du -sh *
  # du -h --max-depth=1 | sort -hr
  find "$1" -type f -size +5M -exec du -h {} + | sort -rh
}

function grecentchanges () {
  git ls-tree -r --name-only HEAD "$1" | while read file; do echo "$(git log -1 --pretty=format:"%ad %h %an: %s" --date=format:'%Y-%m-%d' -- $file) $file"; done | sort -k1,1 -k2,2
}

cleanbranches() {
  # Remove all merge and non-merged branches locally except master and dev.
  git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d
  git branch --no-merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -D
}

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # Utility FUNCTIONS # # # # # # # #  
# # # # # # # # # # # # # # # # # # # # # # # # # # #

function curlheaders () {
  # Usage: curlHeaders https://google.com
  curl -I -L --max-redirs 0 "$1"
}

function curlallheaders () {
  # Usage: curlAllHeaders https://google.com
  # Usage with http: http --follow --headers wealthfront.com
  curl curl -sIL "$1"
}

function curlstatuscode () {
  # Usage: curlStatusCode https://google.com
  curl -I -s -o /dev/null -w '%{http_code}\n' "$1"
}

function getip {
    curl -sL icanhazip.com
}

function usedports {
  lsof -i -P -n | grep LISTEN
}

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # OTHER FUNCTIONS # # # # # # # # #  
# # # # # # # # # # # # # # # # # # # # # # # # # # #


function npmbenchmark () {
  # Example usage:
  # npm_benchmark 10 "test --silent"
  # Or just run the script n times using bash: for i in {1..5}; do <script>; done

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

function test () {
  cd ~/work/frontend/santafe/
  ./t $1
  cd -
}

function checkcores () {
  # Check the number of CPU cored on MacOs or Linux.
  sysctl -n hw.logicalcpu
}

function checkram () {
  # Check the amount of RAM on MacOs or Linux (bytes).
  sysctl hw.memsize | awk '{print $2/1073741824 " GB"}'
}

function followlogs() {
  local service_name="$1"
  local log_file="/var/log/$service_name.log"
  tail -f "$log_file"
}

function copyfile() {
  pbcopy < "$1"
}

function sortpackagejson () {
  npx sort-package-json
}

function kill_port() {
  # Usage: kill_port 2019 -> kills process running on port 2019 `caddy`
  kill -9 $(lsof -t -i:$1)
}

function untar() {
  # Usage: untar file.tar.gz
  tar -xvzf "$1"
}

function humanreadablepath () {
  echo $PATH | tr ':' '\n'
}
