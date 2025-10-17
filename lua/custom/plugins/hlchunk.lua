return {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('hlchunk').setup {
            chunk = {
                enable = true,
                style = {
                    { fg = '#b4b4b9' },
                    { fg = '#c21f30' }, -- Error color for mismatched chunks
                },
                use_treesitter = true,
                chars = {
                    horizontal_line = '─',
                    vertical_line = '│',
                    left_top = '╭',
                    left_bottom = '╰',
                    right_arrow = '>',
                },
                textobject = '',
                max_file_size = 1024 * 1024,
                error_sign = true,
                priority = 15,
                duration = 150,
                delay = 80,
            },
            indent = {
                enable = true,
                use_treesitter = false,
                chars = {
                    '│',
                },
                style = {
                    { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID 'Whitespace'), 'fg', 'gui') },
                },
            },
            line_num = {
                enable = true,
                use_treesitter = true,
                style = '#b4b4b9',
            },
            blank = {
                enable = false,
                chars = {
                    '․',
                },
                style = {
                    { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID 'Whitespace'), 'fg', 'gui') },
                },
            },
        }
    end,
}
