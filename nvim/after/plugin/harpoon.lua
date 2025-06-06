local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-m>", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", ",", function() ui.nav_next() end)

vim.keymap.set("n", "11", function() ui.nav_file(1) end)
vim.keymap.set("n", "22", function() ui.nav_file(2) end)
vim.keymap.set("n", "33", function() ui.nav_file(3) end)
vim.keymap.set("n", "44", function() ui.nav_file(4) end)
vim.keymap.set("n", "55", function() ui.nav_file(5) end)
