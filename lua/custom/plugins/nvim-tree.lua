return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup {
            -- Basic settings
            sort_by = 'case_sensitive',
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
                icons = {
                    glyphs = {
                        git = {
                            unstaged = '󰄱',
                            staged = '',
                            unmerged = '',
                            renamed = '➜',
                            untracked = '?',
                            deleted = '',
                            ignored = '',
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            -- Disable netrw
            disable_netrw = true,
            hijack_netrw = true,
            -- Git integration
            git = {
                enable = true,
                ignore = true,
                timeout = 400,
            },
            -- Actions
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
            -- Live filtering
            live_filter = {
                prefix = '[FILTER]: ',
                always_show_folders = true,
            },
            -- Tab settings for preview
            tab = {
                sync = {
                    open = true,
                    close = true,
                },
            },
        }

        -- Keymaps
        vim.keymap.set('n', '\\', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}
