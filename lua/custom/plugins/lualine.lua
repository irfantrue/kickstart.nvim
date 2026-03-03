return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local colors = {
            bg = '#0D0D0D',
            fg = '#D8DEE9',
            muted = '#2A2A2A',
            blue = '#81A1C1',
            green = '#A3BE8C',
            yellow = '#EBCB8B',
            red = '#BF616A',
            orange = '#D08770',
            cyan = '#88C0D0',
            purple = '#B48EAD',
        }

        local mode_colors = {
            n = colors.blue,
            i = colors.green,
            v = colors.purple,
            V = colors.purple,
            ['\22'] = colors.purple,
            c = colors.yellow,
            R = colors.red,
            t = colors.cyan,
            s = colors.orange,
            S = colors.orange,
        }

        local mode_names = {
            ['NORMAL'] = 'N',
            ['INSERT'] = 'I',
            ['VISUAL'] = 'V',
            ['V-LINE'] = 'VL',
            ['V-BLOCK'] = 'VB',
            ['COMMAND'] = 'C',
            ['REPLACE'] = 'R',
            ['SELECT'] = 'S',
            ['TERMINAL'] = 'T',
            ['EX'] = 'X',
        }

        -- Theme custom biar match sama rose-pine yang di-override
        local custom_theme = {
            normal = {
                a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            insert = {
                a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            visual = {
                a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            replace = {
                a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            command = {
                a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            terminal = {
                a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
                b = { fg = colors.fg, bg = colors.muted },
                c = { fg = colors.fg, bg = colors.bg },
            },
            inactive = {
                a = { fg = colors.muted, bg = colors.bg },
                b = { fg = colors.muted, bg = colors.bg },
                c = { fg = colors.muted, bg = colors.bg },
            },
        }

        require('lualine').setup {
            options = {
                theme = custom_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true, -- satu statusline untuk semua window
                always_divide_middle = true,
                always_show_tabline = true,
                refresh = {
                    statusline = 100, -- lebih responsive
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        fmt = function(str) return mode_names[str] or str:sub(1, 1) end,
                        padding = { left = 2, right = 2 },
                    },
                },
                lualine_b = {
                    {
                        'branch',
                        icon = '',
                        color = { fg = colors.cyan, gui = 'bold' },
                    },
                    {
                        'diff',
                        symbols = { added = ' ', modified = ' ', removed = ' ' },
                        diff_color = {
                            added = { fg = colors.green },
                            modified = { fg = colors.yellow },
                            removed = { fg = colors.red },
                        },
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        path = 1, -- relative path, lebih clean dari path = 4
                        symbols = {
                            modified = '  ',
                            readonly = '  ',
                            unnamed = '  No Name',
                            newfile = '  New',
                        },
                        color = { fg = colors.fg },
                    },
                },
                lualine_x = {
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        sections = { 'error', 'warn', 'info', 'hint' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ' ',
                        },
                        diagnostics_color = {
                            error = { fg = colors.red },
                            warn = { fg = colors.yellow },
                            info = { fg = colors.cyan },
                            hint = { fg = colors.green },
                        },
                        always_visible = false,
                    },
                },
                lualine_y = {
                    {
                        'filetype',
                        colored = true,
                        icon_only = false,
                        color = { fg = colors.fg },
                    },
                },
                lualine_z = {
                    {
                        'location',
                        padding = { left = 1, right = 1 },
                    },
                    {
                        'progress',
                        color = { fg = colors.muted },
                    },
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', color = { fg = colors.muted } } },
                lualine_x = { { 'location', color = { fg = colors.muted } } },
                lualine_y = {},
                lualine_z = {},
            },
        }
    end,
}
