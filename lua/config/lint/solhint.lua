local M = {}

--- Setup solhint linter for Solidity files
--- Checks if solhint is installed and configures nvim-lint
---@param lint table The nvim-lint module
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
