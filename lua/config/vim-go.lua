local M = {}

local function go_ui_input(cmd, prompt)
    vim.ui.input({ prompt = prompt }, function(input)
        if input then vim.cmd(cmd .. ' ' .. input) end
    end)
end

local function setup_buffer_keymaps()
    local opts = function(desc) return { desc = 'Go: ' .. desc, buffer = true, silent = true } end

    -- Build & Run
    vim.keymap.set('n', '<leader>grr', '<cmd>GoRun<CR>', opts 'Run (build + execute)')
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<CR>', opts 'Build (compile)')
    vim.keymap.set('n', '<leader>gii', '<cmd>GoInstall<CR>', opts 'Install (build + install)')

    -- Test
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<CR>', opts 'Test (run all tests)')
    vim.keymap.set('n', '<leader>gtf', '<cmd>GoTestFunc<CR>', opts 'Test Func (run at cursor)')
    vim.keymap.set('n', '<leader>gtc', '<cmd>GoTestCompile<CR>', opts 'Test Compile (verify only)')
    vim.keymap.set('n', '<leader>gc', '<cmd>GoCoverageToggle<CR>', opts 'Coverage (toggle display)')

    -- Tags: Add/Remove
    vim.keymap.set('n', '<leader>gat', '<cmd>GoAddTags<CR>', opts 'Add Tags (json default)')
    vim.keymap.set('n', '<leader>gaT', function() go_ui_input('GoAddTags', 'Tags: ') end, opts 'Add Tags (custom input)')
    vim.keymap.set('n', '<leader>grt', '<cmd>GoRemoveTags<CR>', opts 'Remove Tags')
    vim.keymap.set('n', '<leader>grT', function() go_ui_input('GoRemoveTags', 'Remove Tags: ') end, opts 'Remove Tags (custom input)')

    -- Code generation: Fill Struct/Params
    vim.keymap.set('n', '<leader>gfs', '<cmd>GoFillStruct<CR>', opts 'Fill Struct (literals)')
    vim.keymap.set('n', '<leader>gfp', '<cmd>GoFillParams<CR>', opts 'Fill Params (arguments)')
    vim.keymap.set('n', '<leader>ge', '<cmd>GoIfErr<CR>', opts 'If Err (wrap return)')
    vim.keymap.set('n', '<leader>gim', '<cmd>GoImpl<CR>', opts 'Impl (generate interface stub)')
    vim.keymap.set('n', '<leader>gg', '<cmd>GoGenerate<CR>', opts 'Generate (run go:generate)')

    -- Info & Navigation
    vim.keymap.set('n', '<leader>gd', '<cmd>GoDoc<CR>', opts 'Doc (show symbol docs)')
    vim.keymap.set('n', '<leader>gI', '<cmd>GoInfo<CR>', opts 'Info (type at cursor)')

    -- Refactor
    vim.keymap.set('n', '<leader>gre', '<cmd>GoRename<CR>', opts 'Rename (refactor symbol)')
end

local function register_which_key_group()
    local ok, wk = pcall(require, 'which-key')
    if not ok then return end

    wk.add {
        { '<leader>g', group = '[G]o' },
        { '<leader>ga', group = 'Go: Add Tags' },
        { '<leader>gf', group = 'Go: Fill' },
        { '<leader>gi', group = 'Go: Install and Implement' },
        { '<leader>gr', group = 'Go: Run, Remove and Rename' },
    }
end

function M.setup() setup_buffer_keymaps() end

function M.setup_keymaps() register_which_key_group() end

return M
