" Plugins
call plug#begin('~/.vim/plugged')

set rtp+=/usr/local/opt/fzf

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" python
"" Python Bundle
" Plug 'davidhalter/jedi-vim'
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ruby
Plug 'vim-ruby/vim-ruby'

" rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" Markdown + LaTeX (School stuff)
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Autocomplete + Lint
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Javascript Plugins
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'
"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/deoplete-typescript'
"Rust
Plug 'sebastianmarkow/deoplete-rust'
" clang
Plug 'tweekmonster/deoplete-clang2'

" vim
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'junegunn/vim-easy-align'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'yuttie/comfortable-motion.vim'
Plug 'vim-scripts/grep.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'jiangmiao/auto-pairs'

" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'wellle/targets.vim'

Plug 'terryma/vim-expand-region'
Plug 'unblevable/quick-scope' 

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Themes & colors
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'

call plug#end()
filetype plugin indent on    " required
