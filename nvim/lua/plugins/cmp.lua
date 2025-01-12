local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

local servers = { 
  'gopls',
  'rust_analyzer',
  'pyright',
  'cssls',
  'html',
  'ts_ls',
  'docker_compose_language_service', 
  'docker_ls'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	snippet = {},
  	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
  	  	['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
  	  	-- C-b (back) C-f (forward) for snippet placeholder navigation.
  	  	['<C-Space>'] = cmp.mapping.complete(),
  	  	['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
  	  	  	select = true,
  	  	},
  	  	['<Tab>'] = cmp.mapping(function(fallback)
  	  	  if cmp.visible() then
  	  	    cmp.select_next_item()
  	  	  else
  	  	    fallback()
  	  	  end
  	  	end, { 'i', 's' }),
  	  	['<S-Tab>'] = cmp.mapping(function(fallback)
  	  	  if cmp.visible() then
  	  	    cmp.select_prev_item()
  	  	  else
  	  	    fallback()
  	  	  end
  	  	end, { 'i', 's' }),
  	}),
  	sources = {
		{ name = 'nvim_lsp' },
  	},
  	window = {
		completion = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None,FloatBorder:CmpBorder",
		},
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpDocBorder",
		},
  	}
 }
