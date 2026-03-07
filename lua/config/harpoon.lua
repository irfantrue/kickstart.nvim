local M = {}

--- Create Telescope picker for harpooned files
local function show_file_picker(harpoon_list)
    local items = harpoon_list.items

    if #items == 0 then
        vim.notify('No files harpooned yet!', vim.log.levels.WARN, { title = 'Harpoon' })
        return
    end

    local file_paths = vim.tbl_map(function(item) return item.value end, items)

    require('telescope.pickers')
        .new({}, {
            prompt_title = 'Harpoon Files',
            finder = require('telescope.finders').new_table { results = file_paths },
            previewer = require('telescope.config').values.file_previewer {},
            sorter = require('telescope.config').values.generic_sorter {},
        })
        :find()
end

local function register_which_key_group(harpoon)
    local ok, wk = pcall(require, 'which-key')
    if not ok then
        -- Fallback: register keymaps without which-key
        vim.keymap.set('n', '<leader>ma', function() harpoon:list():add() end, { desc = '[A]dd current file' })
        vim.keymap.set('n', '<leader>ml', function() show_file_picker(harpoon:list()) end, { desc = 'Show [l]ist' })
        vim.keymap.set('n', '<leader>mr', function() harpoon:list():remove() end, { desc = '[R]emove file' })
        vim.keymap.set('n', '<leader>mc', function() harpoon:list():clear() end, { desc = '[C]lear list' })
        for i = 1, 4 do
            vim.keymap.set('n', string.format('<leader>m%d', i), function() harpoon:list():select(i) end, { desc = string.format('Go to file [%d]', i) })
        end
        return
    end

    wk.add {
        { '<leader>m', group = '[M]arks (Harpoon)', icon = '🪝' },
        { '<leader>ma', function() harpoon:list():add() end, desc = '[A]dd current file' },
        { '<leader>ml', function() show_file_picker(harpoon:list()) end, desc = 'Show [l]ist' },
        { '<leader>mr', function() harpoon:list():remove() end, desc = '[R]emove file' },
        { '<leader>mc', function() harpoon:list():clear() end, desc = '[C]lear list' },
        { '<leader>m1', function() harpoon:list():select(1) end, desc = 'Go to file [1]' },
        { '<leader>m2', function() harpoon:list():select(2) end, desc = 'Go to file [2]' },
        { '<leader>m3', function() harpoon:list():select(3) end, desc = 'Go to file [3]' },
        { '<leader>m4', function() harpoon:list():select(4) end, desc = 'Go to file [4]' },
    }
end

function M.setup()
    local harpoon = require 'harpoon'
    harpoon:setup {}
    register_which_key_group(harpoon)
end

return M
