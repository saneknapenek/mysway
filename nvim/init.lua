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
vim.opt.clipboard = 'unnamedplus'

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug ('neovim/nvim-lspconfig')
Plug ('hrsh7th/cmp-nvim-lsp')
Plug ('hrsh7th/cmp-buffer')
Plug ('hrsh7th/cmp-path')
Plug ('hrsh7th/cmp-cmdline')
Plug ('hrsh7th/nvim-cmp')

-- Для пользователей vsnip.
-- Plug ('hrsh7th/cmp-vsnip')
-- Plug ('hrsh7th/vim-vsnip')

-- Для пользователей luasnip.
-- Plug ('L3MON4D3/LuaSnip')
-- Plug ('saadparwaiz1/cmp_luasnip')

-- Для пользователей ultisnips.
-- Plug ('SirVer/ultisnips')
-- Plug ('quangnguyen30192/cmp-nvim-ultisnips')

-- Для пользователей snippy.
-- Plug ('dcampos/nvim-snippy')
-- Plug ('dcampos/cmp-snippy')

Plug('https://github.com/nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('https://github.com/lewis6991/gitsigns.nvim')
Plug('preservim/nerdtree')
Plug('ryanoasis/vim-devicons')
Plug('tiagofumo/vim-nerdtree-syntax-highlight')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim') -- depends on ripgrep, fd
Plug('https://github.com/preservim/tagbar') -- depends on [ctag](https://github.com/universal-ctags/ctags)
Plug('romgrk/barbar.nvim')
Plug('nvim-tree/nvim-web-devicons')

vim.call('plug#end')

require('plugins.nerdtree')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.tagbar')
require('plugins.barbar')
require('plugins.treesitter')

vim.cmd('silent! colorscheme default') 
