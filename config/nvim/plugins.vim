call plug#begin('~/.vim/plugged')

" vim stuff {{{
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/vim-easy-align'
  Plug 'sjl/gundo.vim'
  Plug 'qpkorr/vim-bufkill'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sickill/vim-pasta'

  Plug 'vim-airline/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif

  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif


  Plug 'junegunn/goyo.vim'
  let g:goyo_width = 80
  let g:goyo_linenr = 1
  nmap <F8> :Goyo<cr>

  Plug 'scrooloose/nerdcommenter'

  Plug 'Yggdroot/indentLine'
  let g:indentLine_concealcursor = ''

  Plug 'wellle/targets.vim'
  Plug 'terryma/vim-expand-region'
  Plug 'unblevable/quick-scope' 

  " git {{{
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
  " }}}

  " nerdtree {{{
    Plug 'scrooloose/nerdtree', { 'on': [ 'NERDTreeToggle' ] }
    autocmd vimenter * NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    nnoremap <silent> <leader>f :NERDTreeToggle<CR>
    nnoremap <silent> <leader>v :NERDTreeFind<CR>
    let NERDTreeShowHidden = 1
    let NERDTreeMinimalUI = 1

    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'Xuyuanp/nerdtree-git-plugin'
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
"}}}

" Languages {{{
  Plug 'sheerun/vim-polyglot'
  " autocompletion/linting {{{
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <Tab>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<Tab>" :
          \ coc#refresh()
    " Navigate completion list using tab
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
    
    Plug 'dense-analysis/ale'
    let g:ale_linters = {
    \  'javascript': ['eslint'],
    \  'python': ['pylint', 'flake8'],
    \  'scss': ['stylelint'],
    \  'css': ['stylelint'],
    \  'less': ['stylelint'],
    \  'json': ['eslint'],
    \}

    let g:ale_fixers = {
    \  'javascript': ['prettier', 'prettier-eslint', 'eslint'],
    \  'typescript': ['prettier', 'tslint'],
    \  'python': ['autopep8', 'yapf'],
    \  'scss': ['stylelint'],
    \  'less': ['stylelint'],
    \  'css': ['stylelint'],
    \  'html': ['prettier'],
    \  'mustache': ['prettier'],
    \}

    " Do not lint or fix minified files.
    let g:ale_pattern_options = {
    \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
    \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
    \}
  " }}}

  " html/css {{{
    Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim', { 'for': 'html' }
    Plug 'groenewege/vim-less', { 'for': 'less' }
    Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
    Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
    Plug 'stephenway/postcss.vim', { 'for': 'css' }
    Plug 'mustache/vim-mustache-handlebars'
    Plug 'tmhedberg/matchit'
  " }}}

  " javascript/typescript {{{
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'othree/yajs.vim'
    Plug 'heavenshell/vim-jsdoc'
  " }}}

  " json {{{
    Plug 'elzr/vim-json'
    let g:vim_json_syntax_conceal = 0
  " }}}

  " latex/markdown {{{
    Plug 'lervag/vimtex'
    let g:tex_conceal = ""

    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_conceal = 1
    let g:vim_markdown_conceal_code_blocks = 0
    let g:vim_markdown_folding_disabled = 1
    let g:vim_markdown_math = 1
    let g:vim_markdown_json_frontmatter = 1
    let g:vim_markdown_math = 1
    " let g:tex_conceal = ""
    let g:vim_markdown_math = 1
  " }}}
" }}}

" themes {{{
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tomasiser/vim-code-dark'

  Plug 'ntk148v/vim-horizon'
  Plug 'rakr/vim-one'
  Plug 'morhetz/gruvbox'
  Plug 'ayu-theme/ayu-vim'
  Plug 'joshdick/onedark.vim'
" }}}

call plug#end()
filetype plugin indent on
