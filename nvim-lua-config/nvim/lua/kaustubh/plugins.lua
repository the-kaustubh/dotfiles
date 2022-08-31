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
  use 'nvim-lua/plenary.nvim' -- Common utilities

  use 'majutsushi/tagbar'
  use 'jiangmiao/auto-pairs'
  use 'preservim/nerdtree'
  use 'ryanoasis/vim-devicons'
  use 'nvim-lua/popup.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'tpope/vim-fugitive'
  use 'diepm/vim-rest-console'
  use 'tpope/vim-commentary'
  use 'dense-analysis/ale'
  use 'metakirby5/codi.vim'

  use ({
    'neoclide/coc.nvim', 
    run = function() vim.fn["coc#util#install()"]() end,
  })
  use ({
      'junegunn/fzf',
      run = function() vim.fn["fzf#install()"]() end,
  })
  use 'junegunn/fzf.vim'
  use 'dbeniamine/cheat.sh-vim'

  -- use 'honza/vim-snippets'
  -- use 'SirVer/ultisnips'

  use 'elzr/vim-json'
  use ({
      'fatih/vim-go',
      run = function() vim.cmd("GoInstallBinaries") end,
      })

end)

