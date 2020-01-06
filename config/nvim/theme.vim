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

set cursorline

" ====================
" Colorscheme
" ====================
syntax enable
colorscheme codedark

hi Comment gui=italic cterm=italic
hi htmlArg gui=italic cterm=italic
