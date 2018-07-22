" ============
" Theme module
" ============
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors

set cursorline

" ====================
" Colorscheme
" ====================
set background=dark
"let g:onedark_terminal_italics=1
let g:gruvbox_italic=1
colorscheme gruvbox

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic

" ====================
" Airline
" ====================
"let g:airline_theme='one'

