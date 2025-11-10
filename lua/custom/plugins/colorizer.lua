return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup({
            'css',
            'javascript',
            'markdown',
            'toml',
        }, { mode = 'background' })
    end,
}
