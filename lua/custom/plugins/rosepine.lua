-- Rose Pine theme with custom palette overrides
-- Custom colors for Telescope, Mason, and floating windows
return {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
        require('rose-pine').setup {
            variant = 'auto', -- auto, main, moon, or dawn
            dark_variant = 'main', -- main, moon, or dawn
            extend_background_behind_borders = true,

            enable = {
                terminal = true,
                legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                migrations = true, -- Handle deprecated options automatically
            },

            styles = {
                bold = true,
                italic = false,
                transparency = false,
            },

            -- Semantic color mappings
            groups = {
                border = 'muted',
                link = 'iris',
                panel = 'surface',

                error = 'love',
                hint = 'iris',
                info = 'foam',
                note = 'pine',
                todo = 'rose',
                warn = 'gold',

                git_add = 'foam',
                git_change = 'rose',
                git_delete = 'love',
                git_dirty = 'rose',
                git_ignore = 'muted',
                git_merge = 'iris',
                git_rename = 'pine',
                git_stage = 'iris',
                git_text = 'rose',
                git_untracked = 'subtle',

                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            },

            -- Custom base colors for all variants
            palette = {
                main = {
                    base = '#0D0D0D',
                    overlay = '#1A1A1A',
                },
                moon = {
                    base = '#0D0D0D',
                    overlay = '#1A1A1A',
                },
            },

            -- Override specific highlight groups
            highlight_groups = {
                -- Floating windows
                NormalFloat = { bg = 'base' },
                FloatBorder = { fg = 'overlay', bg = 'base' },

                -- Telescope
                TelescopeSelection = { bg = 'overlay' },
                TelescopePromptNormal = { bg = 'base' },
                TelescopePromptBorder = { fg = 'muted', bg = 'base' },
                TelescopePromptPrefix = { fg = 'iris' },
                TelescopePromptTitle = { fg = 'base', bg = 'iris', bold = true },
                TelescopePreviewTitle = { fg = 'base', bg = 'foam', bold = true },
                TelescopeResultsTitle = { fg = 'base', bg = 'pine', bold = true },
                TelescopeNormal = { bg = 'base' },
                TelescopeBorder = { fg = 'muted', bg = 'base' },
                TelescopePreviewNormal = { bg = 'base' },
                TelescopePreviewBorder = { fg = 'muted', bg = 'base' },
                TelescopeResultsNormal = { bg = 'base' },
                TelescopeResultsBorder = { fg = 'muted', bg = 'base' },

                -- Mason
                MasonNormal = { bg = 'base' },
                MasonHeader = { fg = 'base', bg = 'iris', bold = true },
                MasonHeaderSecondary = { fg = 'base', bg = 'pine', bold = true },
                MasonHighlight = { fg = 'foam' },
                MasonHighlightBlock = { fg = 'base', bg = 'foam' },
                MasonHighlightBlockBold = { fg = 'base', bg = 'foam', bold = true },
                MasonHighlightSecondary = { fg = 'gold' },
                MasonHighlightBlockSecondary = { fg = 'base', bg = 'gold' },
                MasonHighlightBlockBoldSecondary = { fg = 'base', bg = 'gold', bold = true },
                MasonMuted = { fg = 'muted' },
                MasonMutedBlock = { fg = 'base', bg = 'muted' },
                MasonMutedBlockBold = { fg = 'base', bg = 'muted', bold = true },
            },

            before_highlight = function(group, highlight, palette)
                -- Disable all undercurls
                -- if highlight.undercurl then
                --     highlight.undercurl = false
                -- end
            end,
        }

        vim.cmd 'colorscheme rose-pine'
    end,
}
