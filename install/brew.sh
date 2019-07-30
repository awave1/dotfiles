#!/usr/bin/env bash

BREW="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_install() {
  formulas=(
    bat
    diff-so-fancy
    git
    fzf
    grep
    lazygit
    curl
    wget
    tmux
    vim
    macvim
    nvim
    fish
    yarn
    node
    python
    python3
    the_silver_searcher
    exa
    heroku
    neofetch
    gradle
    glfw
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
  )

  while [ ! $# -eq 0 ]; do
    case "$1" in
      --casks)
        for cask in "${casks[@]}"; do
          name=$(echo "$cask" | awk '{print $1}')
          if brew list "$name" > /dev/null 2>&1; then
            echo "$name already installed... skipping"
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
            echo "$name already installed... skipping"
          else
            brew install "$formula"
          fi
        done

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

kitty="$(curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin)"
echo "Installing kitty: $kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin