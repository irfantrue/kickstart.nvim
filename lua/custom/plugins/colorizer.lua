return {
    'norcalli/nvim-colorizer.lua',
    config = function()
        require('colorizer').setup({
            'css',
            'javascript',
            'markdown',
            'toml',
            'conf',
        }, { mode = 'background' })
    end,
}
