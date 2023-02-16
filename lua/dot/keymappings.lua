local opts = { noremap = true, silent = true }

-- window movement
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })

-- split window
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

vim.api.nvim_set_keymap('n', 's>', '<cmd>BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', 's<', '<cmd>BufferPrevious<CR>', opts)
vim.api.nvim_set_keymap('n', 'sc', '<cmd>BufferClose<CR>', opts)

-- indentation
vim.api.nvim_set_keymap('v', '<', '<gv', opts)
vim.api.nvim_set_keymap('v', '>', '>gv', opts)

-- I hate esc
-- currently not working because which-key setup
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)

-- reloading vimrc
-- vim.api.nvim_set_keymap('n', '<Leader>r', ':source $MYVIMRC<CR>', opts)

-- Move selected line /block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv\'', opts)
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv\'', opts)

