return {
    'fatih/vim-go',
    ft = 'go',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':GoInstallBinaries',
    config = function()
        -- ========================================
        -- DISABLE LSP/GOPLS CONFLICTING FEATURES
        -- ========================================
        -- Avoid conflicts with gopls managed via LSP client
        vim.g.go_doc_keywordprg_enabled = 0 -- Disable documentation lookup (handled by LSP)

        -- ========================================
        -- DISABLE AUTO-FORMATTING
        -- ========================================
        -- Let LSP/other formatters handle formatting
        vim.g.go_fmt_autosave = 1 -- Disable gofmt on save
        vim.g.go_imports_autosave = 1 -- Disable goimports on save
        vim.g.go_mod_fmt_autosave = 1 -- Disable go.mod formatting

        -- ========================================
        -- ENABLE SYNTAX HIGHLIGHTING
        -- ========================================
        -- These features don't conflict with gopls and are useful
        vim.g.go_highlight_types = 1 -- Syntax highlighting for types
        vim.g.go_highlight_fields = 1 -- Syntax highlighting for fields
        vim.g.go_highlight_functions = 1 -- Syntax highlighting for functions
        vim.g.go_highlight_function_calls = 1 -- Syntax highlighting for function calls
        vim.g.go_highlight_operators = 1 -- Syntax highlighting for operators

        -- ========================================
        -- DISABLE TEMPLATE CREATION
        -- ========================================
        vim.g.go_template_autocreate = 0 -- Disable automatic template creation

        -- ========================================
        -- HELPER FUNCTION FOR KEYMAPS
        -- ========================================
        local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = true
            opts.silent = true
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Autocmd untuk setup keymaps khusus Go files
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'go',
            callback = function()
                -- Tags management
                map('n', '<leader>gtj', ':GoAddTags json<CR>', { desc = 'Add JSON tags' })
                map('n', '<leader>gty', ':GoAddTags yaml<CR>', { desc = 'Add YAML tags' })
                map('n', '<leader>gtx', ':GoAddTags xml<CR>', { desc = 'Add XML tags' })
                map('n', '<leader>gtd', ':GoAddTags db<CR>', { desc = 'Add DB tags' })
                map('n', '<leader>gtm', ':GoAddTags mapstructure<CR>', { desc = 'Add mapstructure tags' })
                map('n', '<leader>gtr', ':GoRemoveTags<CR>', { desc = 'Remove all tags' })

                -- Code generation
                map('n', '<leader>gie', ':GoIfErr<CR>', { desc = 'Generate if err' })
                map('n', '<leader>gfs', ':GoFillStruct<CR>', { desc = 'Fill struct' })

                -- Which-key setup
                if pcall(require, 'which-key') then
                    local wk = require 'which-key'
                    wk.add {
                        { '<leader>g', group = 'Go', buffer = true },
                        { '<leader>gt', group = 'Go Tags', buffer = true },
                        { '<leader>gi', group = 'Go Generate', buffer = true },
                    }
                end
            end,
        })
    end,
}
