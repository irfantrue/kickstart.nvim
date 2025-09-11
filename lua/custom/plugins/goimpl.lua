return {
    'edolphin-ydf/goimpl.nvim',
    ft = 'go',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
        require('telescope').load_extension 'goimpl'

        -- Setup keymaps dalam autocmd
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'go',
            callback = function()
                vim.keymap.set('n', '<leader>gii', function()
                    require('telescope').extensions.goimpl.goimpl()
                end, {
                    buffer = true,
                    silent = true,
                    desc = 'Implement interface',
                })

                -- Which-key integration
                if pcall(require, 'which-key') then
                    local wk = require 'which-key'
                    wk.add {
                        { '<leader>gii', desc = 'Implement interface', buffer = true },
                    }
                end
            end,
        })
    end,
}
