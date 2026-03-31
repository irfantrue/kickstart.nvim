local M = {}

--- Setup Telescope TODO search keymap
function M.setup() vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>', { desc = 'Find TODO comments' }) end

return M
