local utils = require('plugins.utils')


local BONGO_CAT = {
"╭─────────────────────────────────────────────────────────────────╮",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠏⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⠏⠂⠊⠿⠶⠶⠶⠶⣦⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣶⣄⣀⠀⠀⠀⢀⣤⡶⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢟⠑⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠷⢦⣾⠟⠁⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⣠⣿⠓⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠀⠀⠀⣿⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⠾⠷⢿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡟⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠉⠙⠛⠷⢶⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠀⠙⣷⣀⠀⢰⣷⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠈⠉⠙⠛⠳⠶⢦⣤⣄⣘⣿⡀⠀⠀⠀⠐⠘⢷⠀⠈⠁⢸⣤⣀⣠⡄⠀⠀⠀⠀⢀⣦⡄⣾⡟⠛⠻⣶⣄⠀⠀⠈⠻⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⠶⣶⣤⣤⣄⣀⡂⠀⠀⠀⠉⠉⠙⠻⠷⠿⠃⠀⠈⠟⢹⡇⠈⠀⠀⠀⢻⣆⠀⠀⠀⠹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠛⠛⠷⠶⢦⣤⣤⣀⣀⡀⠀⠀⠀⠀⢸⣇⠀⠀⠀⠀⠀⣿⠆⠀⠀⠀⠹⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠻⠶⠶⣤⣿⣦⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠛⠶⢶⣦⣤⣄⡀⢉⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠻⠶⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻⠶⣦⣤⣀⡀⠀│",
"│⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠻│",
"╰─────────────────────────────────────────────────────────────────╯",
}
local REPO_DIRS = "/home/san/repo"
local PATH_TO_SETTINGS = "/home/san/repo/mysway/nvim" -- nvim directory


function openSettings()
    utils.ChangeDirectory(PATH_TO_SETTINGS)

    local init_lua_path = PATH_TO_SETTINGS .. '/init.lua'
    local init_vim_path = PATH_TO_SETTINGS .. '/init.vim'

    if vim.fn.filereadable(init_lua_path) == 1 then
        vim.cmd('edit init.lua')
    elseif vim.fn.filereadable(init_vim_path) == 1 then
        vim.cmd('edit init.vim')
    else
		vim.api.nvim_err_writeln("Neither init.lua nor init.vim exists.")
    end
end


require('startup').setup({
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 1,
		content = BONGO_CAT,
        highlight = "",
        default_color = "#343457",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 10,
		content = {
            { "  Find File", "Telescope find_files", " " },
            { "  New File", "lua require'startup'.new_file()", " "},
			{ " 󰳏 Open Project", string.format("lua require('plugins.utils').ChooseDirectory('%s')", REPO_DIRS), " " },
            { "  Settings", "lua openSettings()", " " },
        },
        highlight = "",
        default_color = "#6363c4",
        oldfiles_amount = 0,
    },
	old_files = {
        type = "oldfiles",
        oldfiles_directory = true,
        align = "center",
        fold_section = false,
        title = "Oldfiles of Directory",
        margin = 5,
        content = {},
        highlight = "",
        default_color = "#343457",
        oldfiles_amount = 5,
    },
    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 0, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    colors = {
        background = "#111111",
        folded_section = "#6363c4",
    },
    parts = { "header", "body", "old_files"}
})
