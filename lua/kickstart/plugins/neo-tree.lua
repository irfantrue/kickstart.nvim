-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    lazy = false,
    keys = {
        { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
        {
            '<leader>ng',
            ':Neotree float git_status<CR>',
            desc = 'NeoTree Git Status',
            noremap = true,
            silent = true,
        },
    },
    opts = {
        enable_git_status = true,
        default_component_configs = {
            container = {
                enable_character_fade = true,
            },
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = true,
                indent_marker = '│',
                last_indent_marker = '└',
                highlight = 'NeoTreeIndentMarker',
                -- expander config, needed for nesting files
                with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = '',
                expander_expanded = '',
                expander_highlight = 'NeoTreeExpander',
            },
            diagnostics = {
                symbols = {
                    hint = '', -- or your preferred icon
                    info = '',
                    warn = '',
                    error = '',
                },
                highlights = {
                    hint = 'DiagnosticSignHint',
                    info = 'DiagnosticSignInfo',
                    warn = 'DiagnosticSignWarn',
                    error = 'DiagnosticSignError',
                },
            },
            git_status = {
                symbols = {
                    -- Change type
                    added = '✚', -- or "✚"
                    modified = '~', -- or ""
                    deleted = '✖', -- this can only be used in the git_status source
                    renamed = '󰁕', -- this can only be used in the git_status source
                    -- Status type
                    untracked = '',
                    ignored = '',
                    unstaged = '󰄱',
                    staged = '',
                    conflict = '',
                },
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            window = {
                mappings = {
                    ['\\'] = 'close_window',
                },
            },
        },
        sources = {
            'filesystem',
            'buffers',
            'git_status',
        },
        git_status = {
            window = {
                position = 'float',
                mappings = {
                    ['A'] = 'git_add_all',
                    ['gu'] = 'git_unstage_file',
                    ['gU'] = 'git_undo_last_commit',
                    ['ga'] = 'git_add_file',
                    ['gr'] = 'git_revert_file',
                    ['gc'] = 'git_commit',
                    ['gp'] = 'git_push',
                    ['gg'] = 'git_commit_and_push',
                    ['o'] = {
                        'show_help',
                        nowait = false,
                        config = { title = 'Order by', prefix_key = 'o' },
                    },
                    ['oc'] = { 'order_by_created', nowait = false },
                    ['od'] = { 'order_by_diagnostics', nowait = false },
                    ['om'] = { 'order_by_modified', nowait = false },
                    ['on'] = { 'order_by_name', nowait = false },
                    ['os'] = { 'order_by_size', nowait = false },
                    ['ot'] = { 'order_by_type', nowait = false },
                },
            },
        },
    },
}
