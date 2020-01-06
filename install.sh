#!/usr/bin/env bash

PLATFORM=$(uname -s)

main() {
  start=$SECONDS
  while [ ! $# -eq 0 ]; do
    case "$1" in
      -h | --help)
        echo "This script bootstraps dotfiles & installs packages"
        echo "By default, install script will only bootstrap dotfiles."
        echo " "
        echo "Options:"
        echo "  -h, --help:          Prints help"
        echo "  -p, --with-packages: Setup dotfiles and install packages"
        exit
        ;;
      -p | --with-packages)
        install_packages
        ;;
      *)
        break
        ;;
    esac
    shift
  done

  install_dots

  echo "> ✅ : done ($((SECONDS - start))s)"
}

install_dots() {
  echo "> 💻 : setting up dotfiles"
  source ./install/link.sh

  fish_path="$(command -v fish)"
  if ! grep "$fish_path" /etc/shells; then
    echo "Adding $fish_path to /etc/shells"
    echo "$fish_path" | sudo tee -a /etc/shells
  fi

  if [[ "$SHELL" != "$fish_path" ]]; then
    chsh -s "$fish_path"
    echo "shell changed to $fish_path"
  fi
}

install_packages() {
  echo "> 📦 : installing packages"
  if [ "$PLATFORM" == "Darwin" ]; then
    source ./install/brew.sh
  fi
}

main "$@"; exit
