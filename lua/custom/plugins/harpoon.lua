-- Harpoon: Fast file navigation with a mark list
-- Branch 'harpoon2' is the v2 rewrite
return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('config.harpoon').setup() end,
}
