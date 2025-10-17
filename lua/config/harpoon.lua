-- config/harpoon.lua
local M = {}

-- Notification with harpoon logo
local function notify_harpoon(message, level)
    level = level or vim.log.levels.INFO
    vim.notify(message, level, {
        title = 'Harpoon',
    })
end

-- Telescope integration for harpoon file picker
local function create_telescope_picker(harpoon_files)
    local conf = require('telescope.config').values

    -- Extract file paths from harpoon items
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    -- Show empty message if no files harpooned
    if #file_paths == 0 then
        notify_harpoon('No files harpooned yet!', vim.log.levels.WARN)
        return
    end

    -- Create and show telescope picker
    require('telescope.pickers')
        .new({}, {
            prompt_title = 'Harpoon Files',
            finder = require('telescope.finders').new_table {
                results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
        })
        :find()
end

-- Setup key mappings for harpoon
local function setup_keymaps()
    local harpoon = require 'harpoon'

    -- Setup which-key group header
    local ok, wk = pcall(require, 'which-key')
    if ok then
        wk.add {
            { '<leader>g', group = '[G]o Harpoon' },
        }
    end

    -- File management keymaps
    vim.keymap.set('n', '<leader>ga', function()
        harpoon:list():add()
    end, { desc = '[Add] current file' })

    vim.keymap.set('n', '<leader>gh', function()
        create_telescope_picker(harpoon:list())
    end, { desc = 'Show file list' })

    vim.keymap.set('n', '<leader>gr', function()
        harpoon:list():remove()
    end, { desc = '[R]emove' })

    vim.keymap.set('n', '<leader>gc', function()
        harpoon:list():clear()
    end, { desc = '[C]lear' })

    -- Quick file navigation keymaps
    local quick_nav_keys = {
        { key = '<leader>g1', index = 1, desc = 'Go to file [1]' },
        { key = '<leader>g2', index = 2, desc = 'Go to file [2]' },
        { key = '<leader>g3', index = 3, desc = 'Go to file [3]' },
        { key = '<leader>g4', index = 4, desc = 'Go to file [4]' },
    }

    for _, mapping in ipairs(quick_nav_keys) do
        vim.keymap.set('n', mapping.key, function()
            harpoon:list():select(mapping.index)
        end, { desc = mapping.desc })
    end
end

-- Main setup function
function M.setup()
    local harpoon = require 'harpoon'

    -- Initialize harpoon with default configuration
    harpoon:setup {}

    -- Setup all key mappings
    setup_keymaps()
end

return M
