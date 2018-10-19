set PATH /Library/TeX/texbin $PATH

# remove fish greeting
set fish_greeting

# set default editor to nvim
set -U EDITOR nvim

# duh
alias vim="nvim"
alias ls="exa"
alias git-push-all="git push origin ; git push upstream"
alias python="python3"
alias ssh="env TERM=xterm-256color ssh"

funcsave vim
funcsave ls

thefuck --alias | source
