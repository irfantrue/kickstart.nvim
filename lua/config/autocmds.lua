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
