" ============
" Theme module
" ============
syntax on
set t_Co=256
if &term =~ '256color'
  " disable background color erase
  set t_ut=
endif

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
  if (!(has("nvim")))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

set cursorline

" ====================
" Colorscheme
" ====================
syntax enable
let ayucolor="dark"
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
