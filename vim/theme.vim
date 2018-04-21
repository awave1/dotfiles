" ============
" Theme module
" ============
syntax on


" ====================
" Colorscheme
" ====================
" Set TrueColor support
if(has("termguicolors"))
  set termguicolors
endif

let &t_ut=""
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

set background=dark
let g:one_allow_italics=1
colorscheme one

" ====================
" Airline
" ====================




function! ToggleBackground()
  let s:tbg = &background
  if s:tbg == "dark"
    set background=ligt
  else
    set background=dark
  endif
endfunction

