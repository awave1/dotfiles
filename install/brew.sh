#!/usr/bin/env bash

BREW="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_install() {
  formulas=(
    bat
    git
    fzf
    grep
    lazygit
    curl
    wget
    tmux
    vim
    nvim
    fish
    yarn
    node
    nvm
    python
    python3 # python but better :)
    the_silver_searcher # grep but faster
    exa # ls but better
    heroku
    neofetch
    gradle
    glfw
    go
    thefuck # necessary
    coreutils # GNU cli
    delta # superior git diff
    haskell-stack
    "--with-toolchain llvm"
  )
  
  casks=(
    visual-studio-code
    firefox
    google-chrome
    slack
    docker
    postman
    keeweb
    bitwarden
    jetbrains-toolbox
    ngrok
    font-iosevka
    mactex
    vagrant
    iterm2
    kitty
  )
  
  brew update
  
  while [ ! $# -eq 0 ]; do
    case "$1" in
      --casks)
        for cask in "${casks[@]}"; do
          name=$(echo "$cask" | awk '{print $1}')
          if brew list "$name" > /dev/null 2>&1; then
            echo "🧐 cask '$name' already installed... skipping"
          else
            brew cask install "$cask"
          fi
        done
        break
      ;;
      --formulas)
        for formula in "${formulas[@]}"; do
          name=$(echo "$formula" | awk '{print $1}')
          if brew list "$name" > /dev/null 2>&1; then
            echo "🧐 formula '$name' already installed... skipping"
          else
            brew install "$formula"
          fi
        done
        
        echo "post-install configuration..."
        echo "running $(brew --prefix)/opt/fzf/install"
        $(brew --prefix)/opt/fzf/install
        echo "========================================"
        
        echo "installing neovim python"
        pip3 install pynvim
        echo "========================================"
        break
      ;;
    esac
    shift
  done
  
  brew cleanup
  echo "🍻 done!"
}

if test ! "$(command -v brew)"; then
  echo -e "brew is missing; installing brew first...\n"
  /usr/bin/ruby -e "$BREW"
fi

brew_install --formulas --casks

fish_path="$(command -v fish)"
if ! grep "$fish_path" /etc/shells; then
  echo "Adding $fish_path to /etc/shells"
  echo "$fish_path" | sudo tee -a /etc/shells
fi

if [[ "$SHELL" != "$fish_path" ]]; then
  chsh -s "$fish_path"
  echo "shell changed to $fish_path"
fi

