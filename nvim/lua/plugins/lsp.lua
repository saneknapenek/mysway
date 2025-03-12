require('lspconfig').gopls.setup{}

require('lspconfig').pyright.setup{}

require('lspconfig').cssls.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').html.setup {
  capabilities = capabilities,
}

require('lspconfig').ts_ls.setup{
  filetypes = {
    "javascript",
    "typescript",
  },
}

require('lspconfig').docker_compose_language_service.setup{}

require('lspconfig').dockerls.setup{}

require("lspconfig").svelte.setup({
  settings = {
    svelte = {
      plugin = {
        svelte = {
          format = { tabSize = 2, insertSpaces = true }
        }
      }
    }
  }
})
