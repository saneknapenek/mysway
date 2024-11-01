vim.g.NERDTreeIgnore = { '__pycache__' }

vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
