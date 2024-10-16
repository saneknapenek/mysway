local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-M-p>', builtin.find_files, { desc = 'Telescope find files' })