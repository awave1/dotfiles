#!/usr/bin/env bash

BREW="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
PACKAGES="./packages.txt"

echo "Installing base packages..."

if ! hash brew 2> /dev/null; then
  echo -e "brew is missing; installing brew first...\n"
  /usr/bin/ruby -e $BREW
fi

for i in `cat $PACKAGES`; do
  brew install "$i"
done
