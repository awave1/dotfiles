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
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>[ :tabprevious<cr>
map <leader>] :tabnext<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" ==========================
" Mapping 
" ==========================
" save shortcut
nmap <leader>w :w!<cr>
" save and exit
nmap <leader>q :wq<cr>
" toggle cursor centering 
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<cr>


" ==========================
" Plugin Setup
" ==========================
"
" NERDTree
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=1

