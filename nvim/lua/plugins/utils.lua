local telescope = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local finders = require('telescope.finders')
local pickers = require('telescope.pickers')
local previewers = require('telescope.previewers')
local conf = require('telescope.config').values
local scan = require('plenary.scandir')



local utils = {}


function utils.ChangeDirectory(path)
    if vim.fn.isdirectory(path) == 1 then
        vim.cmd('cd ' .. path)
        print("Directory changed to: " .. path)
    else
        print("Invalid directory: " .. path)
    end
end


function utils.ChooseDirectory(dir)
    local dirs = scan.scan_dir(dir, { only_dirs = true, depth = 1 })

    pickers.new({}, {
        prompt_title = "Choose Directory",
        finder = finders.new_table({
            results = dirs,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', function()
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                utils.ChangeDirectory(selection[1])

                local files = scan.scan_dir(selection[1], { hidden = true })
                local last_modified_file = nil
                local last_modified_time = 0

                for _, file in ipairs(files) do
                    local modified_time = vim.fn.getftime(file)
                    if modified_time > last_modified_time then
                        last_modified_time = modified_time
                        last_modified_file = file
                    end
                end

                if last_modified_file then
                    vim.cmd('edit ' .. last_modified_file)
                end
            end)
            return true
        end,
    }):find()
end

return utils
