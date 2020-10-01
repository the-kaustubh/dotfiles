set number
set numberwidth=2
set relativenumber
set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

set nocompatible 

syntax enable
filetype plugin on
set path+=**
set complete+=k~/.vim/keywords

" Search for tag file, go up one directory until $HOME 
set tags=./tags,tags;$HOME

colorscheme default
set wildmenu
"inoremap <Up><Up> <Esc>/<++><Enter>"_c4l
noremap - ddp
noremap _ ddkP

let mapleader="\<space>"

augroup js_grp
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
  autocmd FileType javascript vnoremap <buffer> <leader>c :norm 0i// <return>
  autocmd FileType javascript vnoremap <buffer> <leader>uc :norm 0xxx<return> 
	" autocmd FileType javascript :iabbrev <buffer> iff if :<left> 
	autocmd FileType javascript :iabbrev <buffer> if_ if<space>()<left> 
	autocmd FileType javascript :iabbrev <buffer> { {<return>}<esc>O
  " } breaks the syn highlighting 
  autocmd FileType javascript :iabbrev <buffer> ( ()<left>
  " )  breaks the syn highlighting
augroup END


augroup c_grp
	autocmd!
	autocmd FileType c nnoremap <buffer> <leader>c I//<esc>
	" autocmd FileType javascript :iabbrev <buffer> iff if :<left> 
	autocmd FileType c :iabbrev <buffer> if_ if<space>()<left> 
	autocmd FileType c :iabbrev <buffer> {} {<return>}<esc>O 
augroup END

augroup py_grp
	autocmd!
	" autocmd FileType javascript :iabbrev <buffer> iff if :<left> 
  autocmd FileType python vnoremap <buffer> <leader>c :norm 0i# <return>
  autocmd FileType python vnoremap <buffer> <leader>uc :norm 0xx<return> 
	autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
augroup END
