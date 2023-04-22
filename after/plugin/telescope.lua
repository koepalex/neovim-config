local builtin = require('telescope.builtin')
-- `project files` find all files in folder
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- `git files` find files in git repository (e.g. no node modules)
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- `project search` 
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep >") });
end)
