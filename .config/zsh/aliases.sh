alias dotfiles="code ~/.config/dot-files"

alias grep="grep --color=auto"

# Fzf
alias fzfi='code $(fzf -m --preview="bat --color=always {}")'

# Git
alias gs="git status"
alias ga="git add ."
alias gce='git commit --allow-empty -m "Empty commit"'
alias glog="git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --decorate"

# pnpm
alias pn="pnpm"
alias px="pnpx"

# misc
alias e="exa -lah"
alias cat="bat"
alias cls="clear"
alias directorysizes="du -sh * | sort -hr"
