set --export ANDROID $HOME/Library/Android
set --export ANDROID_HOME $ANDROID/sdk
set --export ANDROID_SDK $ANDROID_HOME
set --export GOPATH "$HOME/go"

set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH

set --export PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin $PATH

set --export JAVA_HOME /Library/Java/JavaVirtualMachines/java-8.jdk/Contents/Home
set -gx PATH $JAVA_HOME/bin $PATH

set -gx PATH $HOME/.local/bin $PATH

set -gx DYLD_LIBRARY_PATH "/usr/lib:/usr/local/lib" $DYLD_LIBRARY_PATH

set -gx DOTS "$HOME/.dev/dotfiles"

# remove fish greeting
set fish_greeting

# set default editor to nvim
set -U EDITOR nvim

alias qq="exit"
alias q="exit"
alias vim="nvim"
alias ls="exa"
alias cat="bat"

alias tmux="tmux -f ~/.config/tmux/.tmux.conf"

alias python="python3"
alias pip="pip3"
alias gg="lazygit"

alias dots="cd $DOTS"

funcsave vim
funcsave ls
funcsave cat
funcsave python
