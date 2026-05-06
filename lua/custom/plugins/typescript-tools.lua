-- Typescript-tools.nvim: TypeScript LSP integration
-- Single tsserver instance per project (better performance than lspconfig)
return {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
        settings = {
            -- Spawn tsserver per-project root, not per-file
            separate_diagnostic_server = true,
            publish_diagnostic_on = 'insert_leave',

            -- Completions
            tsserver_max_memory = 'auto',
            complete_function_calls = true,
            include_completions_with_insert_text = true,

            -- Code lens (shows impl count, references above functions)
            code_lens = 'references_only', -- or 'all' | 'implementations_only' | 'references_only'

            tsserver_path = 'node_modules/typescript/lib/tsserver.js',

            -- Inlay hints (requires Neovim 0.10+)
            tsserver_plugins = {},
            tsserver_file_preferences = {
                includeInlayParameterNameHints = 'literals', -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
                quotePreference = 'auto',
            },

            -- Formatting — delegate to prettier/eslint instead if you use those
            tsserver_format_options = {},

            -- Expose organise imports, add missing imports, fix all, etc.
            expose_as_code_action = {
                'fix_all',
                'add_missing_imports',
                'remove_unused',
                'remove_unused_imports',
                'organize_imports',
            },
        },
    },
}
