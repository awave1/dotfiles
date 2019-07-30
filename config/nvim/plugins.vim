call plug#begin('~/.vim/plugged')

" vim stuff {{{
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/vim-easy-align'
  Plug 'sjl/gundo.vim'
  Plug 'qpkorr/vim-bufkill'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'kristijanhusak/vim-carbon-now-sh'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sickill/vim-pasta'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif

  Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

  Plug 'scrooloose/nerdcommenter'

  Plug 'junegunn/goyo.vim'
  let g:goyo_width = 80
  let g:goyo_linenr = 1
  nmap <F8> :Goyo<cr>

  Plug 'scrooloose/nerdcommenter'
  Plug 'Yggdroot/indentLine'
  Plug 'wellle/targets.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'unblevable/quick-scope' 

  " git {{{
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
  " }}}

  " nerdtree {{{
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    let NERDTreeShowHidden = 1
    nnoremap <silent> <leader>f :NERDTreeToggle<CR>
    nnoremap <silent> <leader>v :NERDTreeFind<CR>
    let NERDTreeMinimalUI = 1

    let g:WebDevIconsOS = 'Darwin'
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1
    let g:DevIconsEnableFoldersOpenClose = 1
    let g:DevIconsEnableFolderExtensionPatternMatching = 1

    let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
  " }}}

  " nnn {{{
    Plug 'mcchrish/nnn.vim'
    let g:nnn#layout = 'vnew'
    let g:nnn#layout = { 'left': '~20%' } " or right, up, down
  " }}}
"}}}

" Languages {{{
  " autocompletion {{{
    Plug 'neomake/neomake'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    let g:neomake_javascript_enabled_makers = ['eslint']
  " }}}

  " html/css {{{
    Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim', { 'for': 'html' }
    Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }
    Plug 'groenewege/vim-less', { 'for': 'less' }
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'stephenway/postcss.vim', { 'for': 'css' }
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'tmhedberg/matchit'
  " }}}

  " javascript/typescript {{{
    Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
    Plug 'moll/vim-node'
    Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
    Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
    Plug 'carlitux/deoplete-ternjs'
    Plug 'posva/vim-vue'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'MaxMEllon/vim-jsx-pretty'
  " }}}

  " json {{{
    Plug 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0
  " }}}

  " c/c++ {{{
    Plug 'zchee/deoplete-clang'
    let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/8.0.0_1/lib/libclang.dylib"
    let g:deoplete#sources#clang#clang_header = "/usr/local/Cellar/llvm/8.0.0_1/lib/clang"
    let g:deoplete#sources#clang#std = {'c': 'c11', 'cpp': 'c++1z', 'objc': 'c11', 'objcpp': 'c++1z'}
  " }}}

  " python {{{

  " }}}

  " rust {{{

  " }}}

  " elm {{{
    Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
  " }}}

  " latex/markdown {{{
    Plug 'lervag/vimtex'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_json_frontmatter = 1
    let g:tex_conceal = ""
    let g:vim_markdown_math = 1
  " }}}

  " formatting {{{
     Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
     let g:prettier#autoformat = 1
     autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.json,*.graphql,*.html,*.vue,*.md PrettierAsync
  " }}}

  Plug 'dart-lang/dart-vim-plugin'
  Plug 'dag/vim-fish'
" }}}

" themes {{{
  Plug 'chriskempson/base16-vim'
  Plug 'joshdick/onedark.vim'
  Plug 'tomasiser/vim-code-dark'
  Plug 'rakr/vim-one'
  Plug 'morhetz/gruvbox'
  Plug 'ayu-theme/ayu-vim'
  Plug 'joshdick/onedark.vim'
" }}}

call plug#end()
filetype plugin indent on
