vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        'go',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'solidity',
        'json',
        'jsonc',
    },
    callback = function()
        vim.opt_local.expandtab = false
        vim.opt_local.tabstop = 4
        vim.opt_local.shiftwidth = 4
    end,
})
