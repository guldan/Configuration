local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', 'F', builtin.git_files, {})
vim.keymap.set('n', 'grep', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end) -- Requires ripgrep to be installed
