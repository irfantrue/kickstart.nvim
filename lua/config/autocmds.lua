-- Filetypes that use 4-space tabs instead of Neovim defaults
-- Includes Go, JavaScript/TypeScript (including JSX/TSX), Solidity, and JSON
local TAB_FILETYPES = {
    'go',
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'solidity',
    'json',
    'jsonc',
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = TAB_FILETYPES,
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})

-- Detect .conf files and domain-like config files (e.g., api.example.com, nginx.conf)
vim.filetype.add {
    extension = {
        conf = function(path, bufnr)
            -- Try to detect nginx config by content
            local content = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
            local nginx_keywords = { 'server', 'location', 'upstream', 'listen', 'proxy_pass' }
            for _, line in ipairs(content) do
                for _, kw in ipairs(nginx_keywords) do
                    if line:match('^%s*' .. kw) then return 'nginx' end
                end
            end
            -- Default to dosini for better key=value highlighting
            return 'dosini'
        end,
    },
    filename = {
        ['.conf'] = 'dosini',
    },
    pattern = {
        -- Match domain-like files: api.example.com, nginx.example.com, etc.
        ['.*%.%a+%.%a+$'] = function(path, bufnr)
            -- Check if it's nginx config by content
            local content = vim.api.nvim_buf_get_lines(bufnr, 0, 50, false)
            local nginx_keywords = { 'server', 'location', 'upstream', 'listen', 'proxy_pass', 'root' }
            for _, line in ipairs(content) do
                for _, kw in ipairs(nginx_keywords) do
                    if line:match('^%s*' .. kw .. '%s') or line:match('^%s*' .. kw .. '%s*{') then return 'nginx' end
                end
            end
            return 'dosini'
        end,
        -- Match specific config files
        ['.*/nginx/.*%.conf$'] = 'nginx',
        ['.*/nginx/.*'] = 'nginx',
        ['.*/apache2/.*%.conf$'] = 'apache',
        ['.*/apache2/sites%-.*/.*'] = 'apache',
        ['.*/httpd/.*%.conf$'] = 'apache',
        ['.*/httpd/conf%.d/.*'] = 'apache',
    },
}
