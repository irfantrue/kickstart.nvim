return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('config.harpoon').setup()
    end,
    keys = {
        { '<leader>h' },
        { '<leader>ha' },
        { '<leader>hh' },
        { '<leader>hr' },
        { '<leader>hc' },
        { '<leader>h1' },
        { '<leader>h2' },
        { '<leader>h3' },
        { '<leader>h4' },
    },
}
