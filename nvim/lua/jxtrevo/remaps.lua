vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<C-I>", ":lua vim.lsp.buf.format()<CR>") 
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>ko")
vim.keymap.set("n", "n", "nzz")
