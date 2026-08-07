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

# wf-autopull: keep each repo's default branch (master/main) up to date in the
# background. Never modifies a feature-branch working tree, never stashes.
# See `wf-autopull --help`.
_wf_autopull_log() {
  local line="[$(date '+%Y-%m-%d %H:%M:%S')] $2"
  print -r -- "$line" >> "$1"
  [[ -t 1 ]] && print -r -- "$line"
}

_wf_autopull_in_progress() {
  local g="$1/.git"
  [[ -e "$g/MERGE_HEAD" || -e "$g/CHERRY_PICK_HEAD" || -e "$g/REVERT_HEAD" \
     || -d "$g/rebase-apply" || -d "$g/rebase-merge" || -e "$g/BISECT_LOG" ]]
}

_wf_autopull_default_branch() {
  local repo="$1" remote="$2" ref b
  ref=$(git -C "$repo" symbolic-ref --quiet --short "refs/remotes/$remote/HEAD" 2>/dev/null) || true
  if [[ -n "$ref" ]]; then
    print -r -- "${ref#$remote/}"
    return
  fi
  for b in master main; do
    if git -C "$repo" show-ref --verify --quiet "refs/heads/$b"; then
      print -r -- "$b"
      return
    fi
  done
  print -r -- ""
}

function wf-autopull() {
  emulate -L zsh
  setopt local_options null_glob

  local repos_root="${WF_AUTOPULL_ROOT:-$HOME/Sites}"
  local remote="${WF_AUTOPULL_REMOTE:-origin}"
  local log_file="${WF_AUTOPULL_LOG:-$HOME/.wf-autopull.log}"
  local timeout_secs="${WF_AUTOPULL_TIMEOUT:-30}"
  local dry_run=0 verbose=0
  local PATH="/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:$PATH"

  local arg
  for arg in "$@"; do
    case "$arg" in
      --dry-run) dry_run=1 ;;
      --verbose|-v) verbose=1 ;;
      -h|--help)
        cat <<'HELP'
Usage: wf-autopull [--dry-run] [--verbose]

Keeps each repo's default branch (master/main) up to date.
Never touches a feature branch's working tree. Never stashes.

Per repo:
  mid-rebase/merge/bisect   skip
  on default branch         git pull --ff-only
                            (git itself refuses if dirty paths would clash)
  on any other branch       git fetch <remote> <default>:<default>
                            (advances local ref as fast-forward, no checkout)

Env config:
  WF_AUTOPULL_ROOT     parent dir of repos    (default: ~/Sites)
  WF_AUTOPULL_REMOTE   remote name            (default: origin)
  WF_AUTOPULL_LOG      log file               (default: ~/.wf-autopull.log)
  WF_AUTOPULL_TIMEOUT  per-git-command secs   (default: 30)
HELP
        return 0
        ;;
      *)
        print -u2 -- "wf-autopull: unknown arg: $arg"
        return 2
        ;;
    esac
  done

  local lock_dir="${TMPDIR:-/tmp}/wf-autopull.lock.d"
  if ! mkdir "$lock_dir" 2>/dev/null; then
    _wf_autopull_log "$log_file" "another wf-autopull run is in progress; exiting"
    return 0
  fi
  trap "rmdir '$lock_dir' 2>/dev/null" EXIT INT TERM HUP

  if [[ ! -d "$repos_root" ]]; then
    _wf_autopull_log "$log_file" "repos root does not exist: $repos_root"
    return 1
  fi

  local timeout_cmd=()
  if command -v gtimeout >/dev/null 2>&1; then
    timeout_cmd=(gtimeout "$timeout_secs")
  elif command -v timeout >/dev/null 2>&1; then
    timeout_cmd=(timeout "$timeout_secs")
  fi

  _wf_autopull_log "$log_file" "wf-autopull start (root=$repos_root, remote=$remote, dry_run=$dry_run)"

  local count=0 repo name default current before after out rc
  for repo in "$repos_root"/*; do
    [[ -d "$repo/.git" || -f "$repo/.git" ]] || continue
    count=$((count + 1))
    name="${repo#$repos_root/}"

    if _wf_autopull_in_progress "$repo"; then
      (( verbose )) && _wf_autopull_log "$log_file" "skip $name (rebase/merge/bisect in progress)"
      continue
    fi

    if ! git -C "$repo" remote get-url "$remote" >/dev/null 2>&1; then
      (( verbose )) && _wf_autopull_log "$log_file" "skip $name (no remote '$remote')"
      continue
    fi

    default=$(_wf_autopull_default_branch "$repo" "$remote")
    if [[ -z "$default" ]]; then
      (( verbose )) && _wf_autopull_log "$log_file" "skip $name (no master or main)"
      continue
    fi

    current=$(git -C "$repo" symbolic-ref --quiet --short HEAD 2>/dev/null || print -- DETACHED)

    if (( dry_run )); then
      if [[ "$current" == "$default" ]]; then
        _wf_autopull_log "$log_file" "DRY: $name on $default -> git pull --ff-only $remote $default"
      else
        _wf_autopull_log "$log_file" "DRY: $name on $current -> git fetch $remote $default:$default"
      fi
      continue
    fi

    if [[ "$current" == "$default" ]]; then
      before=$(git -C "$repo" rev-parse HEAD 2>/dev/null)
      out=$("${timeout_cmd[@]}" git -C "$repo" pull --ff-only --quiet "$remote" "$default" 2>&1)
      rc=$?
      after=$(git -C "$repo" rev-parse HEAD 2>/dev/null)
      if (( rc == 0 )); then
        if [[ "$before" != "$after" ]]; then
          _wf_autopull_log "$log_file" "ok   $name (pulled $default ${before:0:8} -> ${after:0:8})"
        else
          (( verbose )) && _wf_autopull_log "$log_file" "noop $name (already at $default ${after:0:8})"
        fi
      else
        (( verbose )) && _wf_autopull_log "$log_file" "warn $name (pull --ff-only $default failed: ${out%%$'\n'*})"
      fi
    else
      before=$(git -C "$repo" rev-parse "$default" 2>/dev/null)
      if "${timeout_cmd[@]}" git -C "$repo" fetch --quiet --no-tags "$remote" "$default:$default" >/dev/null 2>&1; then
        after=$(git -C "$repo" rev-parse "$default" 2>/dev/null)
        if [[ "$before" != "$after" ]]; then
          _wf_autopull_log "$log_file" "ok   $name (advanced $default ${before:0:8} -> ${after:0:8} while on $current)"
        else
          (( verbose )) && _wf_autopull_log "$log_file" "noop $name (already at $default ${after:0:8})"
        fi
      else
        (( verbose )) && _wf_autopull_log "$log_file" "warn $name (fetch $default:$default failed; not fast-forwardable or offline)"
      fi
    fi
  done

  _wf_autopull_log "$log_file" "wf-autopull done ($count repos scanned)"
}
