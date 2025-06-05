local lsp = require('lsp-zero')

lsp.preset('recommended')

local cmp = require('cmp')
local types = require("cmp.types")


local function deprioritize_snippet(entry1, entry2)
	if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then return false end
	if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then return true end
end

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.confirm({ select = true })
	}),
	sorting = {
		priority_weight = 2,
		comparators = {
			deprioritize_snippet,
			-- the rest of the comparators are pretty much the defaults
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.scopes,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	preselect = cmp.PreselectMode.None,
})

-- requires python3 -m pip install python-lsp-server
-- and apt install python3-venv
require 'lspconfig'.pylsp.setup {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'W391' },
					maxLineLength = 180
				}
			}
		}
	}
}

require 'lspconfig'.rust_analyzer.setup({
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
	settings = {
		rust_analyzer = {
			useLibraryCodeForTypes = true,
			autoSearchPaths = true,
			autoImportCompletions = false,
			reportMissingImports = true,
			followImportForHints = true,

			cargo = {
				allFeatures = true,
			},
			checkOnSave = {
				command = "cargo clippy",
			},
		},
	},
})
require 'lspconfig'.gopls.setup({})
lsp.setup()
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
})

require 'lspconfig'.ts_ls.setup({})

require('mason').setup()
