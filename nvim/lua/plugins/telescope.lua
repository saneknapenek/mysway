local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-M-p>', builtin.find_files, { desc = 'Telescope find files' })

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
			},
		},
	},
})
