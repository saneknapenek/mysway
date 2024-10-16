vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.encoding = 'UTF-8'


local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('https://github.com/lewis6991/gitsigns.nvim')

Plug('preservim/nerdtree')
-- Настройки для NERDTree
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })

Plug('ryanoasis/vim-devicons')

Plug('tiagofumo/vim-nerdtree-syntax-highlight')


vim.call('plug#end')

require('gitsigns').setup()

vim.cmd('silent! colorscheme seoul256')