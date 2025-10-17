return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('config.harpoon').setup()
    end,
    keys = {
        { '<leader>gh' },
        { '<leader>ga' },
        { '<leader>gh' },
        { '<leader>gr' },
        { '<leader>gc' },
        { '<leader>g1' },
        { '<leader>g2' },
        { '<leader>g3' },
        { '<leader>g4' },
    },
}
