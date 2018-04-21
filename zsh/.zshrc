# If you come from bash you might have to change your $PATH.
#
# export ANDROID_SDK=/Users/awave/Library/Android/sdk
# export ANDROID_NDK=/Users/awave/Library/Android/sdk/ndk-bundle
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID_NDK"
export PATH="$PATH:$ANDROID_SDK/tools/bin:$PATH"

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/awave/Library/Android/sdk/platform-tools":$PATH
export PATH=$PATH:~/Library/Android/sdk/build-tools/25.0.0/
export PYTHONPATH=$PYTHONPATH/usr/local/lib/python3.6/site-packages
export RUST_SRC_PATH=/usr/local/src/rust/sr

#Path to your oh-my-zsh installation.
export ZSH=/Users/awave/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="evan"
# ZSH_THEME="powerlevel9k/powerlevel9k"

TERM=xterm-256color

KEYTIMEOUT=1

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
      . ~/.config/exercism/exercism_completion.zsh
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias sourceZsh='source ~/.zshrc'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias ssh_ins="ssh -l agolo124 ins.mtroyal.ca"

alias c="clear"
alias celar="clear"
alias clera="clear"
alias clr="clear"
alias ls="ls -laF"
alias fucking="sudo"

alias commit="git commit -a"
alias fetch="git fetch"
alias pull="git pull"
alias push="git push"
alias merge="git merge"

alias jobb="~/Library/Android/sdk/tools/bin/jobb"

alias py="python3"
alias ll="exa -al"
alias ls="exa"
alias start="npm start"
alias colortest="~/.dev/colortest.sh"

alias zipalign_apk="zipalign -v 4 app-release.apk $2.apk"

alias musictimer="~/.dev/dotfiles/sleep_timer.py $1 $2"
alias rename="~/.dev/dotfiles/rename.py $1 $2"

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
eval $(/usr/libexec/path_helper -s)


# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

