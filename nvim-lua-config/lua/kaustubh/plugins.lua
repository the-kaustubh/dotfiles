vim.cmd [[colorscheme gruvbox]]

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  -- use 'github/copilot.vim'
  use 'wbthomason/packer.nvim'

  use 'morhetz/gruvbox'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'jiangmiao/auto-pairs'
  use 'ryanoasis/vim-devicons'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'diepm/vim-rest-console'
  use 'tpope/vim-commentary'
  use 'dense-analysis/ale'
  use 'metakirby5/codi.vim'
  use 'preservim/nerdtree'
  use 'wellle/context.vim'
    
  use 'vim-airline/vim-airline'
  use 'junegunn/fzf.vim'
  use 'dbeniamine/cheat.sh-vim'
  use 'glepnir/dashboard-nvim'

  use 'elzr/vim-json'

  use ({ 'neoclide/coc.nvim', run = function() vim.fn["coc#util#install()"]() end })
  use ({ 'junegunn/fzf', run = function() vim.fn["fzf#install()"]() end })
  use ({ 'fatih/vim-go', run = function() vim.cmd("GoInstallBinaries") end })

  use '/Users/Kaustubh.Murumkar/Documents/cheatsh-go'
end)
