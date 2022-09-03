local keymap = vim.keymap

vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

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
  ['[g'] = '<Plug>(coc-diagnostic-prev)',
  [']g'] = '<Plug>(coc-diagnostic-next)',
  ['<leader>a'] = '<Plug>(coc-codeaction-selected)',
  ['<leader>ac'] = '<Plug>(coc-codeaction)',
  ['<leader>qf'] = '<Plug>(coc-fix-current)',
  ['<leader>cl'] = '<Plug>(coc-codelens-action)',

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
  ['<c-b>'] = ':NERDTreeToggle<CR>',
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

keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })

keymap.set('x', 'if', '<Plug>(coc-funcobj-i)')
keymap.set('o', 'if', '<Plug>(coc-funcobj-i)')
keymap.set('x', 'af', '<Plug>(coc-funcobj-a)')
keymap.set('o', 'af', '<Plug>(coc-funcobj-a)')

keymap.set('x', 'ic', '<Plug>(coc-classobj-i)')
keymap.set('o', 'ic', '<Plug>(coc-classobj-i)')
keymap.set('x', 'ac', '<Plug>(coc-classobj-a)')
keymap.set('o', 'ac', '<Plug>(coc-classobj-a)')

vim.cmd [[
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
]]
