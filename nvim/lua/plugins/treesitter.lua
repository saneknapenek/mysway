require('nvim-treesitter.configs').setup {
  ensure_installed = { "go", "rust", "bash", "css", "csv", "dockerfile", "git_config", "git_rebase", "gitcommit", "gitignore", "go", "gomod", "gosum", "html", "http", "ini", "javascript", "json", "json5", "jsonc", "lua", "make", "markdown", "nginx", "pem", "proto", "python", "rust", "sql", "ssh_config", "toml", "typescript", "vim", "xml", "yaml" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
