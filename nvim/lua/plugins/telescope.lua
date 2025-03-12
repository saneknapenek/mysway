local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-M-p>', builtin.find_files, { desc = 'Telescope find files' })


vim.keymap.set('n', 'gr', function()
  require('telescope.builtin').lsp_references()
end, { desc = "Find references in the project" })

require('telescope').setup({
	defaults = {
		hidden = true,
		vimgrep_arguments = {
			"rg",
			"--color=never",
    		"--follow",
    		"--hidden",
    		"--no-heading",
    		"--with-filename",
    		"--line-number",
    		"--column",
    		"--smart-case",
			"--hidden",

			"--glob=!**/.git/*",
			"--glob=!**/.idea/*",
			"--glob=!**/.vscode/*",
			"--glob=!**/build/*",
			"--glob=!**/dist/*",
			"--glob=!**/yarn.lock",
			"--glob=!**/package-lock.json",
			"--glob=!**/venv/*",
			"--glob=!**/__pycache__/*",
			"--glob=!**/node_modules/*",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = {
				"rg",
				"--files",
				"--hidden",
				"--glob=!**/.git/*",
				"--glob=!**/.idea/*",
				"--glob=!**/.vscode/*",
				"--glob=!**/build/*",
				"--glob=!**/dist/*",
				"--glob=!**/yarn.lock",
				"--glob=!**/package-lock.json",
				"--glob=!**/venv/*",
				"--glob=!**/__pycache__/*",
				"--glob=!**/node_modules/*",
			},
		},
	},
})
