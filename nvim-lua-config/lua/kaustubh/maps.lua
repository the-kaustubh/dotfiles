local keymap = vim.keymap

vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Golang Specific
vim.g.go_fmt_command = "goimports"
vim.g.go_jump_to_error = 0
vim.g.go_auto_sameids = 0
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_generate_tags = 1
vim.g.go_highlight_build_constraints = 1

-- Leader
vim.g.mapleader = " "
keymap.set('n', '<C-s>', ':w<CR>')

local nnoremap_tbl = {
  -- Telescope
  ['<Leader>ff'] = '<Cmd>Telescope find_files<cr>',
  ['<leader>fg'] = '<cmd>Telescope live_grep<cr>',
  ['<leader>fb'] = '<cmd>Telescope buffers<cr>',
  ['<leader>fh'] = '<cmd>Telescope help_tags<cr>',
  ['<leader>fh'] = '<cmd>Telescope help_tags<cr>',

  -- COC
  ['<leader>gd'] = '<Plug>(coc-definition)',
  ['<leader>gr'] = '<Plug>(coc-references)',
  ['<leader>gy'] = '<Plug>(coc-type-definition)',
  ['<leader>gi'] = '<Plug>(coc-implementation)',
  ['<leader>rn'] = '<Plug>(coc-rename)',

  -- Fugitive 
  ['<leader>gs'] = ':G<cr>',
  ['<leader>gc'] = ':Git commit<cr>',
  ['<leader>gp'] = ':Git push<cr>',


  -- Misc
  ['<c-p>'] = ':FZF<cr>',
  ['<leader>o'] = ':only<cr>',
  ['<cr>'] = ':nohls<cr>',
  ['<leader>='] = 'gg=G',
  ['-'] = 'ddp',
  ['_'] = 'ddkP',
}

for k,v in pairs(nnoremap_tbl) do
  keymap.set('n', k, v, { noremap = true, silent = true })
end

keymap.set('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })
vim.cmd [[
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
]]
