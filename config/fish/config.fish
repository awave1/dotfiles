eval (starship init fish)

set --export ANDROID $HOME/Library/Android;
set --export ANDROID_HOME $ANDROID/sdk;
set -gx PATH $ANDROID_HOME/tools $PATH;
set -gx PATH $ANDROID_HOME/tools/bin $PATH;
set -gx PATH $ANDROID_HOME/platform-tools $PATH;

set --export JAVA_HOME /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home;
set -gx PATH $JAVA_HOME/bin $PATH;

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

alias tetris="ssh netris.rocketnine.space"

funcsave vim
funcsave ls
funcsave cat
funcsave python

thefuck --alias | source
set -g fish_user_paths "/usr/local/opt/tcl-tk/bin" $fish_user_paths
