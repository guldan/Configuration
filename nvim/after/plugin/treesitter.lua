local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
	highlight = { enable = true },
	indent = { enable=false },

	ensure_installed = {
	"python",
	"javascript",
	"typescript",
	"json",
	"yaml",
	"lua",
	"html",
	"css",
	"go"
	},
auto_install = true
})
