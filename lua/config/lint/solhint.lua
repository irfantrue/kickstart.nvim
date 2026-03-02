local M = {}

function M.setup(lint)
    if vim.fn.executable 'solhint' == 1 then
        lint.linters_by_ft = {
            solidity = { 'solhint' },
        }
    else
        vim.notify('solhint not found, run "bun install -g solhint"', vim.log.levels.WARN)
    end
end

return M
