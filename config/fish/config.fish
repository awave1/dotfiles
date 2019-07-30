set PATH /Library/TeX/texbin $PATH
set PATH "$HOME/.pub-cache/bin" $PATH

# remove fish greeting
set fish_greeting

# set default editor to nvim
set -U EDITOR nvim

# duh
alias vim="nvim"
alias ls="exa"
alias cat="bat"

alias python="python3"
alias todo="todolist"
alias vup="vagrant up"
alias vhalt="vagrant halt"

funcsave vim
funcsave ls
funcsave cat
funcsave python

thefuck --alias | source
