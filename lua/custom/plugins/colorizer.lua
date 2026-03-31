-- Nvim-colorizer: Preview hex/rgb colors in buffer
-- Shows color swatch next to color codes
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
