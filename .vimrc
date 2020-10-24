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
noremap <c-c> <Nop> 

set nocompatible 

syntax enable
filetype plugin on
set path+=**
set complete+=k~/.vim/keywords
set lazyredraw
set laststatus=2
set ruler
set scrolloff=6

" Search for tag file, go up one directory until $HOME 
set tags=./tags,tags;$HOME
set wildmenu
colorscheme default

let mapleader="\<space>"

noremap - ddp
noremap _ ddkP
nnoremap Q <Nop>
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
nnoremap <c-q> :q<CR>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprevious<cr>

vnoremap <leader>s" xi""<Esc>P
vnoremap <leader>s' xi''<Esc>P
vnoremap <leader>s( xi()<Esc>P
vnoremap <leader>s{ xi{}<Esc>P
vnoremap <leader>s< xi<><Esc>P

iabbrev <buffer> {} {<return>}<esc>O 

augroup js_grp
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>
  autocmd FileType javascript vnoremap <buffer> <leader>c :norm 0i// <return>
  autocmd FileType javascript vnoremap <buffer> <leader>uc :norm 0xxx<return> 
	autocmd FileType javascript :iabbrev <buffer> if_ if<space>()<left> 
  autocmd FileType javascript :iabbrev <buffer> ( ()<left>
  " )  breaks the syn highlighting
augroup END


augroup c_grp
	autocmd!
	autocmd FileType c nnoremap <buffer> <leader>c I//<esc>
	autocmd FileType c :iabbrev <buffer> if_ if<space>()<left> 
	autocmd FileType c :iabbrev <buffer> {} {<return>}<esc>O 
augroup END

augroup py_grp
	autocmd!
  autocmd FileType python vnoremap <buffer> <leader>c :norm 0i# <return>
  autocmd FileType python vnoremap <buffer> <leader>uc :norm 0xx<return> 
	autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
augroup END

" ------------------------------------------ "
" ------------------plugins----------------- "
packadd! dracula
packadd! rainbow
colorscheme dracula

let g:rainbow_active = 1

nmap <F8> :TagbarToggle<CR>
