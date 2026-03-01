return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require 'lint'

        -- cek apakah solhint terinstall
        if vim.fn.executable 'solhint' == 1 then
            lint.linters_by_ft = {
                solidity = { 'solhint' },
            }

            vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
                callback = function() lint.try_lint() end,
            })
        else
            vim.notify('solhint not found, run "bun install -g solhint"', vim.log.levels.WARN)
        end
    end,
}
