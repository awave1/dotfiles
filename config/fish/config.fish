set --export ANDROID $HOME/Library/Android
set --export ANDROID_HOME "$ANDROID/sdk"
set PATH /Library/TeX/texbin $PATH
set PATH "$HOME/.pub-cache/bin" $PATH
set -gx PATH "$ANDROID_HOME/emulator" $PATH
set -gx PATH "$ANDROID_HOME/tools" $PATH
set -gx PATH "$ANDROID_HOME/tools/bin" $PATH
set -gx PATH "$ANDROID_HOME/platform-tools" $PATH

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
