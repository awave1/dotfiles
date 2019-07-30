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
}

install_packages() {
  echo "> 📦 : installing packages"
  if [ "$PLATFORM" == "Darwin" ]; then
    xterm256_italics=$PWD/tmux/xterm-256color-italic.terminfo
    tmux256_italics=$PWD/tmux/tmux-256color.terminfo

    source ./install/brew.sh

    # Allow italics in tmux
    tic -x $xterm256_italics
    tic -x $tmux256_italics
  fi

  # todo: add arch packages?
}

main "$@"; exit
