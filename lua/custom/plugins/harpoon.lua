return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.harpoon').setup() end,
}
