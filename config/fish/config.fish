# eval (starship init fish)

# set -gx PATH (brew --prefix coreutils)/libexec/gnubin /usr/local/bin $PATH;

set --export ANDROID $HOME/Library/Android
set --export ANDROID_HOME $ANDROID/sdk
set --export ANDROID_SDK $ANDROID_HOME
set --export GOPATH "$HOME/go"

set -gx PATH $ANDROID_HOME/tools $PATH
set -gx PATH $ANDROID_HOME/tools/bin $PATH
# set -gx PATH $ANDROID_HOME/platform-tools $PATH;

set --export PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin $PATH

set --export PAYARA_HOME $HOME/payara5
set --export GLASSFISH_HOME $HOME/payara5

# set --export JAVA_HOME /Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home;
set --export JAVA_HOME /Library/Java/JavaVirtualMachines/java-8.jdk/Contents/Home
set -gx PATH $JAVA_HOME/bin $PATH

set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $PAYARA_HOME/bin $PATH

set -gx DYLD_LIBRARY_PATH "/usr/lib:/usr/local/lib" $DYLD_LIBRARY_PATH

set -gx DOTS "$HOME/.dev/dotfiles"

set -gx CFLAGS -I/usr/local/Cellar/argp-standalone/1.3/include/ $CFLAGS
set -gx LDFLAGS -L/usr/local/Cellar/argp-standalone/1.3/lib/ -largp $LDFLAGS
set -gx LDFLAGS "-L/usr/local/opt/bison/lib"
set -gx LDFLAGS "-L/usr/local/opt/flex/lib"
set -gx CPPFLAGS "-I/usr/local/opt/flex/include"
set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

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

alias python="python3.8"
alias pip="pip3.8"
alias todo="todolist"

alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vrdp="vagrant rdp"

alias tetris="ssh netris.rocketnine.space"
alias gg="lazygit"
alias vup="vagrant up"
alias vhalt="vagrant halt"

alias dots="cd $DOTS"
# alias dl="youtube-dl -x --audio-format \"wav\" $1"

funcsave vim
funcsave ls
funcsave cat
funcsave python

# thefuck --alias | source

# status --is-interactive; and source (jenv init -|psub)

set -g fish_user_paths "/usr/local/opt/bison/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/flex/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
