#!/usr/bin/env bash

DOTFILES=$HOME/.dev/dotfiles
linkables=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
config_files=$(find "$DOTFILES/config" -d 1)

echo "🔗 : creating symlinks (for .symlink files)"
for file in $linkables; do
  target="$HOME/$(basename "$file" '.symlink')"

  if [ -e "$target" ]; then
    echo "~${target#$HOME} already exists. skipping..."
  else
    echo "linking $file"
    ln -s "$file" "$target"
  fi
done
echo "🔗 : done"

if [ ! -d "$HOME/.config" ]; then
  echo "creating ~/.config"
  mkdir -p "$HOME/.config"
fi

echo "🔗 : creating symlinks (for .config)"

for config in $config_files; do
  target="$HOME/.config/$(basename "$config")"

  if [ -e "$target" ]; then
    echo "~/${target#$HOME} aleady exists. skipping"
  else
    echo "linking $config"
    ln -s "$config" "$target"
  fi
done
echo "🔗 : done"

echo "🔗 : installing nvim plugins"
nvim_plugged_dir="$HOME/.config/nvim/plugged"
if [ -e "$nvim_plugged_dir" ]; then
  echo "~/${nvim_plugged_dir#$HOME} aleady exists. skipping"
else
  echo "installing vim plugins"
  nvim +'PlugInstall --sync' +qa
fi
echo "🔗 : done"

