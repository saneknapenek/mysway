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
vim.opt.signcolumn = "yes"

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('neovim/nvim-lspconfig')

Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('Snikimonkd/cmp-go-pkgs')
Plug('vrslev/cmp-pypi')

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

Plug('ray-x/go.nvim')
Plug('ray-x/guihua.lua')

-- Plug('rktjmp/lush.nvim')
-- Plug('~/repo/mysway/nvim/themes/my-neovim-theme')

Plug('startup-nvim/startup.nvim')
Plug('rebelot/kanagawa.nvim')

vim.call('plug#end')

require('plugins.nerdtree')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.tagbar')
require('plugins.barbar')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.go_nvim')

require('plugins.startup')
require('plugins.kanagawa')

-- require('lspconfig').pyright.setup{}
-- require('lspconfig').rust_analyzer.setup{}

 vim.cmd('silent! colorscheme kanagawa')
