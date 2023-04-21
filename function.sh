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

function killport {
  kill $(lsof -i:$1)
}