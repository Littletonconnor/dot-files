alias grep="grep --color=auto"

# Git
alias gs="git status"
alias ga="git add ."
alias gce='git commit --allow-empty -m "Empty commit"'
alias glog="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --decorate -n 10"
alias feature_branch_diff="git log origin/master..HEAD --oneline"

# pnpm
alias pn="pnpm"
alias px="pnpx"

# misc
alias e="eza -lah"
alias cat="bat"
alias li="yazi"
alias cls="clear"
alias directory_sizes="du -sh * | sort -hr"
