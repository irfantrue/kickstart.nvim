-- Aerial.nvim: Symbol navigation sidebar
-- Shows outline/tree of functions, types, etc. for the current file
return {
    'stevearc/aerial.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('aerial').setup {
            -- Backend priority: treesitter > LSP for symbol parsing
            backends = { 'treesitter', 'lsp', 'markdown', 'asciidoc', 'man' },

            -- Window layout
            layout = {
                max_width = 60,
                width = nil,
                min_width = 40,
                default_direction = 'prefer_right',
                placement = 'window',
                resize_to_content = true,
                preserve_equality = false,
            },
            close_on_select = true,
        }

        -- Toggle aerial with backslash
        vim.keymap.set('n', '<leader>\\', '<cmd>AerialToggle<CR>')
    end,
}
