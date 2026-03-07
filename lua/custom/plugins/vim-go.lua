return {
    'fatih/vim-go',
    ft = { 'go', 'gomod', 'gowork', 'gotmpl' },
    event = { 'BufReadPre *.go', 'BufNewFile *.go' },
    build = ':GoInstallBinaries',
    init = function()
        -- Disable vim-go's LSP features (let nvim-lsp/gopls handle these)
        vim.g.go_def_mapping_enabled = 0
        vim.g.go_doc_keywordprg_enabled = 0
        vim.g.go_code_completion_enabled = 0
        vim.g.go_diagnostics_enabled = 0
        vim.g.go_metalinter_autosave = 0

        -- Format & imports on save
        vim.g.go_fmt_autosave = 1
        vim.g.go_imports_autosave = 1
        vim.g.go_fmt_command = 'goimports'

        -- Syntax highlighting — enable everything
        vim.g.go_highlight_types = 1
        vim.g.go_highlight_fields = 1
        vim.g.go_highlight_functions = 1
        vim.g.go_highlight_function_calls = 1
        vim.g.go_highlight_operators = 1
        vim.g.go_highlight_extra_types = 1
        vim.g.go_highlight_build_constraints = 1
        vim.g.go_highlight_generate_tags = 1
        vim.g.go_highlight_variable_declarations = 1
        vim.g.go_highlight_variable_assignments = 1

        -- Test configuration
        vim.g.go_test_show_name = 1
        vim.g.go_test_timeout = '30s'

        -- Use terminal for running commands (plays nice with toggleterm/floaterm)
        vim.g.go_term_enabled = 1
        vim.g.go_term_mode = 'split'
        vim.g.go_term_reuse = 1

        -- Template engine highlights (useful for html/go templates)
        vim.g.go_template_autocreate = 0

        -- Modifytags config
        vim.g.go_addtags_transform = 'snakecase'
        vim.g.go_addtags_default = 'json'

        -- Register which-key group (once)
        vim.api.nvim_create_autocmd('VimEnter', {
            once = true,
            callback = function() require('config.vim-go').setup_keymaps() end,
        })

        -- Setup keymaps for Go buffers
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
            callback = function() require('config.vim-go').setup() end,
        })
    end,
}
