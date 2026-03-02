local M = {}

--- Show notification with Harpoon branding
---@param message string
---@param level vim.log.level|nil
local function notify(message, level) vim.notify(message, level or vim.log.levels.INFO, { title = 'Harpoon' }) end

--- Create Telescope picker for harpooned files
---@param harpoon_files HarpoonList
local function show_file_picker(harpoon_files)
    local items = harpoon_files.items

    if #items == 0 then
        notify('No files harpooned yet!', vim.log.levels.WARN)
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

local function register_which_key_group()
    local ok, wk = pcall(require, 'which-key')
    if ok then wk.add { { '<leader>g', group = '[G]o Harpoon', icon = '🪨' } } end
end

local function setup_file_keymaps(harpoon)
    vim.keymap.set('n', '<leader>ga', function() harpoon:list():add() end, { desc = '[A]dd current file' })
    vim.keymap.set('n', '<leader>gh', function() show_file_picker(harpoon:list()) end, { desc = '[S]how file list' })
    vim.keymap.set('n', '<leader>gr', function() harpoon:list():remove() end, { desc = '[R]emove file' })
    vim.keymap.set('n', '<leader>gc', function() harpoon:list():clear() end, { desc = '[C]lear list' })
end

local function setup_nav_keymaps(harpoon)
    for i = 1, 4 do
        vim.keymap.set('n', string.format('<leader>g%d', i), function() harpoon:list():select(i) end, { desc = string.format('Go to file [%d]', i) })
    end
end

local function setup_keymaps()
    local harpoon = require 'harpoon'
    register_which_key_group()
    setup_file_keymaps(harpoon)
    setup_nav_keymaps(harpoon)
end

function M.setup()
    local harpoon = require 'harpoon'
    harpoon:setup {}
    setup_keymaps()
    notify('Harpoon loaded', vim.log.levels.DEBUG)
end

return M
