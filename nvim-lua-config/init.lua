require('kaustubh.base')
require('kaustubh.highlights')
require('kaustubh.maps')
require('kaustubh.plugins')
require('kaustubh.set')
require('kaustubh.customise_plugins')

vim.opt.clipboard:append { 'unnamedplus' }

vim.cmd [[colorscheme gruvbox]]
vim.cmd('filetype off')
vim.wo.relativenumber = true
