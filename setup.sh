#!/bin/bash

XTERM_256_ITALICS=$PWD/xterm-256color-italic.terminfo
TMUX_256_ITALICS=$PWD/tmux-256color.terminfo

# Link tmux conf
ln -s $PWD/tmux/.tmux.conf $HOME/.tmux.conf

# Install vim-plug
echo "installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install tpm
echo "installing tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link vim config
mkdir ~/.vim
ln -s $PWD/vim/.vimrc $HOME/.vimrc
ln -s $PWD/vim/.vimrc $HOME/.config/nvim/init.vim
ln -s $PWD/vim/functions.vim $HOME/.vim/functions.vim
ln -s $PWD/vim/general.vim $HOME/.vim/general.vim
ln -s $PWD/vim/plugins.vim $HOME/.vim/plugins.vim
ln -s $PWD/vim/theme.vim $HOME/.vim/theme.vim
ln -s $PWD/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
ln -s $PWD/chunkwm/.chunkwmrc $HOME/.chunkwmrc
ln -s $PWD/skhd/.skhdrc $HOME/.skhdrc

# install all plugins
vim +'PlugInstall --sync' +qa

tic -x $XTERM_256_ITALICS
tic -x $TMUX_256_ITALICS

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts && ./install.sh
cd .. && rm -rf fonts

chmod +x ./scripts/list-path.sh
chmod +x ./scripts/musictimer.py

ln -s $PWD/scripts/list-path.sh /usr/local/bin/list-path
ln -s $PWD/scripts/musictimer.py /usr/local/bin/musictimer

link_file() {
  src=$1
  dest=$2
  source_dir=$PWD/$src
  for file in $(ls $source_dir); do
    filename=$(basename $file)
    echo $file
  done
}

