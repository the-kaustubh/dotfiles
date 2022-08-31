require('kaustubh.base')
require('kaustubh.highlights')
require('kaustubh.maps')
require('kaustubh.plugins')

vim.opt.clipboard:append { 'unnamedplus' }

vim.cmd [[colorscheme gruvbox]]
vim.cmd('filetype off')
vim.cmd('filetype plugin indent on')
