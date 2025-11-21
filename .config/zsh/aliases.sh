alias grep="grep --color=auto"

# Git
alias gs="git status"
alias ga="git add ."
alias gce='git commit --allow-empty -m "Empty commit"'
alias glog="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --decorate -n 10"
alias feature_branch_diff="git log origin/master..HEAD --oneline"
alias lg="lazygit"

# pnpm
alias pn="pnpm"
alias px="pnpx"

# IDE
alias c="cursor ."

# misc
alias e="eza -lah"
alias cat="bat"
alias li="nnn -dH"
alias cls="clear"
alias directory_sizes="du -sh * | sort -hr"
