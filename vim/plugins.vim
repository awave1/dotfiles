" Plugins
call plug#begin('~/.vim/plugged')

set rtp+=/usr/local/opt/fzf

" language support
Plug 'davidhalter/jedi-vim'
Plug 'plasticboy/vim-markdown'
Plug 'justinmk/vim-syntax-extra'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'rip-rip/clang_complete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'adimit/prolog.vim'

" vim
Plug 'junegunn/vim-easy-align'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'wellle/targets.vim'
Plug 'vim-scripts/AutoClose'

Plug 'terryma/vim-expand-region'
Plug 'unblevable/quick-scope' 
Plug '/usr/local/opt/fzf'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'

" Themes & colors
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'Erichain/vim-monokai-pro'
Plug 'crusoexia/vim-monokai'
Plug 'Alvarocz/vim-northpole'
Plug 'ajh17/Spacegray.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'sonph/onehalf'
Plug 'jacoborus/tender.vim'

call plug#end()
filetype plugin indent on    " required
