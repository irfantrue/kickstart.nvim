return {
    'zenbones-theme/zenbones.nvim',
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = 'rktjmp/lush.nvim',
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
        -- Enable compatibility mode if you're not using lush.nvim (skip if using lush)
        -- vim.g.zenbones_compat = 1

        -- Adjust contrast for comments (0 to 100)
        vim.g.zenbones_darken_comments = 60

        -- Makes non-current windows dimmer for focus
        vim.g.zenbones_dim_inactive_windows = true

        -- Optional: Set background for better integration (dark or light)
        vim.o.background = 'dark' -- or "light" if you prefer

        -- Optional: Make UI elements (like statusline, line numbers) more muted
        vim.g.zenbones_darken_nontext = 40

        -- Optional: Disable italics if you don't like them
        vim.g.zenbones_italic_comments = true
        vim.g.zenbones_italic_keywords = false
        vim.g.zenbones_italic_functions = false

        -- Optional: Use terminal colors (if you want it to match your terminal theme)
        vim.g.zenbones_terminal_colors = true

        -- Set the colorscheme
        vim.cmd.colorscheme 'zenbones'
    end,
}
