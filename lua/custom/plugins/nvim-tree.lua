-- Nvim-tree: File explorer sidebar
-- Replaces netrw with a modern file browser
return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup {
            -- Display settings
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
            -- File filtering
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            -- Netrw replacement
            disable_netrw = true,
            hijack_netrw = true,
            -- Git status (400ms timeout)
            git = {
                enable = true,
                ignore = true,
                timeout = 400,
            },
            -- File actions
            actions = {
                open_file = {
                    quit_on_open = false,
                },
            },
            -- Live filter prefix
            live_filter = {
                prefix = '[FILTER]: ',
                always_show_folders = true,
            },
            -- Sync with current tab
            tab = {
                sync = {
                    open = true,
                    close = true,
                },
            },
        }

        -- Toggle with <leader><Tab>
        vim.keymap.set('n', '<leader><Tab>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
}
