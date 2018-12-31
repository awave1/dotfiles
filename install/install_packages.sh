#!/usr/bin/env bash

PLATFORM=$1

BREW="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
PACKAGES="install/macos_packages"

echo "Installing base packages"

macos() {
  if ! hash brew 2> /dev/null; then
    echo -e "brew is missing; installing brew first...\n"
    /usr/bin/ruby -e $BREW
  fi

  for i in `cat $PACKAGES`; do
    brew install "$i"
  done
}

rust() {
  echo "installing rust..."

  curl https://sh.rustup.rs -sSf | sh
}

if [ "$PLATFORM" == "Darwin" ]; then
  macos
fi


rust
