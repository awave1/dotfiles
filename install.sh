#!/usr/bin/env bash

#
# Basic setup script (for macos only right now)
#
main() {
  PLATFORM=$(uname -s)
  exec ./install/install_packages.sh "$PLATFORM"

  if [ "$PLATFORM" == "Darwin" ]; then
    echo "installing macos specific stuff"
    # Only setup macos stuff
    xterm256_italics=$PWD/xterm-256color-italic.terminfo
    tmux256_italics=$PWD/tmux-256color.terminfo

    link chunkwm/.chunkwmrc $HOME/.chunkwmrc
    link chunkwm/.skhdrc $HOME/.skhdrc

    exec ./install/macos.sh
    tic -x $xterm256_italics
    tic -x $tmux256_italics
  fi

  setup_vim
  setup_tmux
  setup_fish
  setup_kitty
  install_fonts

  install_scripts
}

setup_vim() {
  vimplug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  echo "setting up vim"

  mkdir $HOME/.vim
  mkdir -p $HOME/.config/nvim

  link vim/.vimrc $HOME/.vimrc
  link vim/.vimrc $HOME/.config/nvim/init.vim
  link vim/general.vim $HOME/.vim/general.vim
  link vim/functions.vim $HOME/.vim/functions.vim
  link vim/plugins.vim $HOME/.vim/plugins.vim
  link vim/snippets.vim $HOME/.vim/snippets.vim

  echo "installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs "$vimplug_url"
  
  # install all plugins
  vim +'PlugInstall --sync' +qa
}

setup_tmux() {
  echo "setting up tmux"
  mkdir $HOME/.tmux

  echo "installing tpm..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  link tmux/.tmux.conf $HOME/.tmux.conf
}

setup_kitty() {
  echo "setting up kitty"

  link kitty/kitty.conf $HOME/.config/kitty/kitty.conf
}

setup_fish() {
  echo "setting up fish"
  mkdir -p $HOME/.config/fish/functions

  link fish/config.fish $HOME/.config/fish/config.fish
  link fish/config.fish $HOME/.config/fish/functions/fish_prompt.fish
}

install_fonts() {
  echo "installing powerline fonts"

  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts && ./install.sh
  cd .. && rm -rf fonts
}

install_scripts() {
  # install whatever in ./scripts folder
  # @TODO dynamically create aliases for scripts in ./scripts

  echo "installing local scripts..."
  install_rust_scripts
}

install_rust_scripts() {
  echo "installing rust scripts..."

  cargo install exa
}

# force link files (in case if dest file exists)
link() {
  src=$PWD/$1
  dest=$2

  ln -sf $src $dest
}

main "$@"; exit

