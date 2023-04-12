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

function getip {
    curl -sL icanhazip.com
}