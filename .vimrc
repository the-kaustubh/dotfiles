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

set noswapfile
syntax enable
filetype on
filetype plugin on
set path+=**
set cpt+=k~/.vim/keywords
set lazyredraw
set laststatus=2
set ruler
set scrolloff=4

" Search for tag file, go up one directory until $HOME 
" set tags=./tags,tags;$HOME
" set wildmenu colorscheme default

let mapleader="\<space>"

" ------------------------------------------ "
" ------------------plugins----------------- "
call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'sirver/ultisnips'
Plug 'briancollins/vim-jst'
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
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'metakirby5/codi.vim'
Plug 'elzr/vim-json'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go'
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
  autocmd FileType javascript nnoremap <silent> <c-l> :!eslint --fix %<cr>
augroup END


augroup c_grp
	autocmd!
augroup END
	" autocmd FileType c :set cpt+=k/home/kaustubh/Documents/C/pico/pico-sdk/tags

augroup py_grp
	autocmd!
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

" --------------------GO LANG
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" ------------------GO LANG

autocmd BufRead,BufNewFile * syntax enable
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
