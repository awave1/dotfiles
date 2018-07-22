" Plugins
call plug#begin('~/.vim/plugged')

set rtp+=/usr/local/opt/fzf

" language support
" c
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'

" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'posva/vim-vue'

" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ruby
Plug 'vim-ruby/vim-ruby'

" swift + objc + ios
Plug 'keith/swift.vim'
Plug 'jgoulah/cocoa.vim'
Plug 'eraserhd/vim-ios'

" rust
" Vim racer
Plug 'racer-rust/vim-racer'
" Rust.vim
Plug 'rust-lang/rust.vim'

" Kotlin
Plug 'udalov/kotlin-vim'

Plug 'dag/vim-fish'

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
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/grep.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'kien/ctrlp.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif

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
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'Erichain/vim-monokai-pro'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline-themes'
Plug 'challenger-deep-theme/vim'

call plug#end()
filetype plugin indent on    " required
