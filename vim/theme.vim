" ============
" Theme module
" ============
syntax on

if (has("termguicolors"))
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


set cursorline

" ====================
" Colorscheme
" ====================
syntax enable
set background=dark
let g:onedark_terminal_italics=1
let g:gruvbox_italic=1
colorscheme tender

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic

" ====================
" Airline
" ====================
let g:airline_theme='tender'

