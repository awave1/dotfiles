export ZSH=/Users/awave/.oh-my-zsh

export TERM="xterm-256color-italic"

# Path stuff
export ANDROID_SDK=/Users/awave/Library/Android/sdk
export ANDROID_NDK=/Users/awave/Library/Android/sdk/ndk-bundle
export PATH="$PATH:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID_NDK"
export PATH="$PATH:$ANDROID_SDK/tools/bin:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/awave/Library/Android/sdk/platform-tools":$PATH
export PATH=$PATH:~/Library/Android/sdk/build-tools/25.0.0/
export PYTHONPATH=$PYTHONPATH/usr/local/lib/python3.6/site-packages
export RUST_SRC_PATH=/usr/local/src/rust/sr

# ============================================================
# Plugins
# plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# ============================================================
plugins=(git, zsh-autosuggestions, vi-mode)


# ============================================================
# Plugin/Commands Configs
# ============================================================
LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
eval $(/usr/libexec/path_helper -s)

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# ============================================================
# Theme
# ============================================================
ZSH_THEME="spaceship"
TERM=xterm-256color

# ============================================================
# Keys & Input mode (vi)
# ============================================================
KEYTIMEOUT=1


source $ZSH/oh-my-zsh.sh

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"



# ===============================
# Aliases
# ===============================
alias sourceZsh='source ~/.zshrc'

alias vim='nvim'
alias python='python3'
alias py="python"
alias pip='pip3'

alias c="clear"
alias fucking="sudo"
alias ls="exa"
alias la="exa -a"
alias ll="exa -laF"
alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

alias dev='cd ~/.dev/'
alias work='cd ~/.dev/renoworks/'
alias dots='cd ~/.dev/dotfiles/'

