" =================
" General Vim setup
" =================
"
" -> General
" -> Vim UI
" -> Files and backups
" -> Indentation
" -> Visual Mode
" -> Movement, tabs, buffers
" -> Mapping
" -> Plugin Setup
" 

" ==========================
" General
" ==========================
set history=1000
set encoding=UTF-8

" enable filetype plugins
filetype plugin on
filetype indent on

" auto reload when a file is changed
set autoread
" ignore case when searching
set ignorecase
set smartcase

" turn off swap files
set nobackup

" turn off mouse support
set mouse=a

" ==========================
" Vim UI
" ==========================
" turn on line numbers
set number
" turn on wildmenu
set wildmenu
" buffer becomes hidden it is abandoned
set hid
" regex magic
set magic
" show matching brackets when text indicator is over them
set showmatch 
" how many tenths of a second to blink when matching brackets
set mat=2

set foldcolumn=1

command! BG call ToggleBackground()!


" ==========================
" Files and backups
" ==========================
set noswapfile

" 
" Indentation
" 
set tabstop=2
set shiftwidth=2
set expandtab

" c
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab


" ==========================
" Movement, tabs, buffers
" ==========================
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <leader>j <C-W>j
map <C-k> <C-W>k
map <leader>k <C-W>k
map <C-h> <C-W>h
map <leader>h <C-W>h
map <C-l> <C-W>l
map <leader>l <C-W>l

map <leader>= :vertical-split<cr>
map <leader>_ :split<cr>

map <leader>[ :bprev<cr>
map <leader>] :bnext<cr>
map <leader>dd :BD<cr>

" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" resize current pane
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>


" Search and grepping
if executable('ag')
  " use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_commang = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


" ==========================
" Mapping 
" ==========================
" save shortcut
nmap <leader>w :w!<cr>
" save and exit
nmap <leader>q :wq<cr>
" toggle cursor centering 
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>

autocmd FileType markdown inoremap <F10> $``$<Left><Left>
autocmd FileType markdown inoremap <F11> **<Left>
autocmd FileType markdown inoremap <F12> ****<Left><Left>

nmap <F8> :Goyo<cr>


" ==========================
" Plugin Setup
" ==========================
"
" NERDTree
"
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif
 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

let NERDTreeShowHidden=1
" let NERDTreeMapOpenInTab='<ENTER>'
nnoremap <silent> <leader>f :NERDTreeToggle<CR>
nnoremap <silent> <leader>v :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" 
" Ale
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}
let g:ale_javascript_eslint_suppress_missing_config = 1
" autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}

"
" deoplete
"
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"
" UtilSnips
"
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" vim-airline
"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" 
" vim-racer (rust)
"
set hidden
let g:racer_cmd = "/Users/awave/.cargo/bin/racer"
let g:racer_experimental_completer = 1

"
" goyo.vim
"
let g:goyo_width = 120
let g:goyo_linenr = 1

"
" vim-markdown
"
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

"
" vim-prettier
"
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
