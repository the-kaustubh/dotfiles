set number
set numberwidth=2
set relativenumber
set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
"set expandtab
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

set nocompatible 

set noswapfile
syntax enable
filetype on
filetype plugin on
set path+=**
set complete+=k~/.vim/keywords
set lazyredraw
set laststatus=2
set ruler
set scrolloff=4

" Search for tag file, go up one directory until $HOME 
" set tags=./tags,tags;$HOME
set wildmenu
colorscheme default

let mapleader="\<space>"

" ------------------------------------------ "
" ------------------plugins----------------- "
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'sirver/ultisnips'
Plug 'kana/vim-surround'
Plug 'oblitum/rainbow'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'diepm/vim-rest-console'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
Plug 'storyn26383/vim-vue'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'eslint/eslint'
" Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim'
Plug 'elzr/vim-json'
call plug#end()
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'

noremap - ddp
noremap _ ddkP
nnoremap Q <Nop>
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-q> :q<CR>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprevious<cr>

vnoremap <leader>s" xi""<Esc>P
vnoremap <leader>s' xi''<Esc>P
vnoremap <leader>s( xi()<Esc>P
vnoremap <leader>s{ xi{}<Esc>P
vnoremap <leader>s< xi<><Esc>P

nnoremap <silent> <leader><c-b> :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :only<cr>
nnoremap <silent> <cr> :nohls<cr>

nnoremap <silent> <leader>= gg=G

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

nmap <F8> :TagbarToggle<CR>
let g:rainbow_active = 1
colorscheme dracula

" ------------ After plugin mappings --------- "
nnoremap <c-c> <nop>
nmap <leader>gs :G<CR>
nmap <leader>g; :diffget //3<CR>
nmap <leader>ga :diffget //2<CR>

let b:vrc_horizontal_split = 1
let g:vue_pre_processors = []
let g:ale_linters = {
			\   'javascript': ['eslint'],
			\}

if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

autocmd BufRead,BufNewFile * syntax enable
