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

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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

" Display comments as italics
highlight Comment cterm=italic

" 
" Indentation
" 
set tabstop=2
set shiftwidth=2
set expandtab

if has('conceal')
  set concealcursor=nc
  set conceallevel=2
endif

" c
autocmd FileType c setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType cpp setlocal tabstop=2 shiftwidth=2 expandtab

" Turn on spellcheck for markdown & latex
autocmd FileType latex,tex,md,markdown setlocal spell


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

autocmd FileType markdown inoremap <F10> $$<Left>
autocmd FileType markdown inoremap <F11> **<Left>
autocmd FileType markdown inoremap <F12> ****<Left><Left>

" Enable comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+

function GitCommit()
  " close nerdtree by default (almost never used in commits)
  autocmd VimEnter * NERDTreeClose

  setlocal spell

  " highlight bad spelling
  :hi SpellBad ctermbg=red ctermbg=white guibg=red guifg=white

  " Margin for emails, make it obvious where 72 characters is.
  setlocal textwidth=72
  setlocal colorcolumn=+1

  " Strip space on save.
  fun! <SID>StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
  endfun

  autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespace()
endfunction

autocmd FileType gitcommit call GitCommit()
