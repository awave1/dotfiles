#!/usr/bin/env bash

DOTFILES=$HOME/.dev/dotfiles

echo "> 🔗 : creating symlinks"
linkables=$(find -H "$DOTFILES" -maxdepth 3 -name '*.symlink')
for file in $linkables; do
  target="$HOME/$(basename "$file" '.symlink')"

  if [ -e "$target" ]; then
    echo "~${target#$HOME} already exists. skipping..."
  else
    echo "linking $file"
    ln -s "$file" "$target"
  fi
done

if [ ! -d "$HOME/.config" ]; then
  echo "creating ~/.config"
  mkdir -p "$HOME/.config"
fi

config_files=$(find "$DOTFILES/config" -d 1)
for config in $config_files; do
  target="$HOME/.config/$(basename "$config")"

  if [ -e "$target" ]; then
    echo "~/${target#$HOME} aleady exists. skipping"
  else
    echo "linking $config"
    ln -s "$config" "$target"
  fi
done

# vim_files=(
#   "$HOME/.vim:$DOTFILES/config/nvim"
#   "$HOME/.vimrc:$DOTFILES/config/nvim/init.vim"
# )

# for file in "${vim_files[@]}"; do
#   key=${file%%:*}
#   val=${file#*:}
#   if [ -e "${key}" ]; then
#     echo "${key} already exists. skipping..."
#   else
#     echo "linking $key"
#     ln -s "${val}" "${key}"
#   fi
# done

echo "installing vim plugins"
nvim +'PlugInstall --sync' +qa