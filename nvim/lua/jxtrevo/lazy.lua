local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

plugins = {
	-- init.lua:
    {'nvim-telescope/telescope.nvim', tag = '0.1.5',dependencies = { 'nvim-lua/plenary.nvim' }},
	"theprimeagen/harpoon",
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	-- lsp
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	{'hrsh7th/nvim-cmp', dependencies = {'L3MON4D3/LuaSnip'}},
	'rust-lang/rust.vim',
	{"folke/tokyonight.nvim",lazy = false,priority = 1000,opts = {}},


}

require("lazy").setup(plugins)
