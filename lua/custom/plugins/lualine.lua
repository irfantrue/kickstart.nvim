return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            options = {
                theme = 'auto',
                component_separators = { left = '│', right = '│' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str)
                            -- Mapping mode names ke single character
                            local mode_map = {
                                ['NORMAL'] = 'N',
                                ['INSERT'] = 'I',
                                ['VISUAL'] = 'V',
                                ['V-LINE'] = 'VL',
                                ['V-BLOCK'] = 'VB',
                                ['COMMAND'] = 'C',
                                ['REPLACE'] = 'R',
                                ['SELECT'] = 'S',
                                ['TERMINAL'] = 'T',
                            }
                            return mode_map[str] or str:sub(1, 1) -- fallback ke karakter pertama
                        end,
                    },
                },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { { 'filename', path = 4 } },
                lualine_x = {
                    'encoding',
                    'filetype',
                    -- {
                    --     'lsp_status',
                    --     -- icon = '', -- f013
                    --     symbols = {
                    --         -- Standard unicode symbols to cycle through for LSP progress:
                    --         spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                    --         -- Standard unicode symbol for when LSP is done:
                    --         done = '✓',
                    --         -- Delimiter inserted between LSP names:
                    --         separator = ' ',
                    --     },
                    --     -- List of LSP names to ignore (e.g., `null-ls`):
                    --     ignore_lsp = {},
                    -- },
                },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
        }
    end,
}
