set number
set numberwidth=2
set relativenumber
set autoindent
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

set nocompatible

set noswapfile
set encoding=UTF-8
syntax enable
filetype on
filetype plugin on
set path+=**
set cpt+=k~/.vim/keywords
set lazyredraw
set laststatus=2
set ruler
set scrolloff=4

" LEADER
let mapleader="\<space>"

" ------------------------------------------ "
" ------------------plugins----------------- "

call plug#begin()
" Visual
Plug 'morhetz/gruvbox'
Plug 'oblitum/rainbow'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" Utility
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-fugitive'
Plug 'diepm/vim-rest-console'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'eslint/eslint'
Plug 'dense-analysis/ale'
Plug 'metakirby5/codi.vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'tpope/vim-eunuch'
Plug 'dbeniamine/cheat.sh-vim'
Plug 'nvim-treesitter/playground'
Plug 'neovim/nvim-lspconfig'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }
" Snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'

" Language Packs
Plug 'briancollins/vim-jst'
Plug 'elzr/vim-json'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go'
Plug 'neoclide/coc-vetur'
Plug 'rust-lang/rust.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

call plug#end()

" Plug 'dikiapp/minimalist'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Old Plugins
" Plug 'valloric/youcompleteme'
" Plug 'scrooloose/nerdtree'
" Plug 'scrooloose/nerdcommenter'
" Plug 'kana/vim-surround'

noremap - ddp
noremap _ ddkP
nnoremap Q <Nop>
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
nnoremap <c-q> :q<CR>

nnoremap <leader>t :tabnew<cr>
nnoremap <leader>l :tabnext<cr>
nnoremap <leader>h :tabprevious<cr>

vnoremap <leader>s" xi""<Esc>P
vnoremap <leader>s' xi''<Esc>P
vnoremap <leader>s( xi()<Esc>P
vnoremap <leader>s{ xi{}<Esc>P
vnoremap <leader>s< xi<><Esc>P

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

augroup js_grp
	autocmd!
  autocmd FileType javascript nnoremap <silent> <c-l> :!eslint --fix %<cr>
augroup END


augroup c_grp
	autocmd!
augroup END

augroup py_grp
	autocmd!
augroup END

nmap <F8> :TagbarToggle<CR>
let g:rainbow_active = 1

" colorscheme dracula
colorscheme gruvbox

" ------------ After plugin mappings --------- "
nnoremap <c-c> <nop>

let b:vrc_horizontal_split = 1
let g:vue_pre_processors = []

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

" --------------------GO LANG
let g:go_diagnostics_enabled = 1
let g:go_metalinter_enabled = []

" don't jump to errors after metalinter is invoked
let g:go_jump_to_error = 0
let g:go_fmt_command = "goimports"
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
" ========= Snippets
let g:UltiSnipsExpandTrigger="<tab>"
" list all snippets for current filetype
let g:UltiSnipsListSnippets="<c-l>"

"  Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" COC
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>rn <Plug>(coc-rename)

" This
nnoremap <silent> <c-b> :NERDTreeToggle<cr>
nnoremap <silent> <leader>o :only<cr>
nnoremap <silent> <cr> :nohls<cr>
nnoremap <silent> <leader>= gg=G

" Fugitive
nnoremap <silent> <leader>gs :G<cr>
nnoremap <silent> <leader>gc :Git commit<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <c-p> :FZF<cr>
" nnoremap <silent> <c-p> :GFiles<cr>

" Rename

" Firenvim
au BufEnter *.com_*.txt set filetype=markdown

autocmd BufRead,BufNewFile * syntax enable
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]
let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }
