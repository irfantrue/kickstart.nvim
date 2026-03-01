-- Manual mapping untuk move lines up/down
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Manual mapping untuk move right/left (indent/dedent)
vim.keymap.set('n', '<C-l>', '>>', { desc = 'Indent line' })
vim.keymap.set('n', '<C-h>', '<<', { desc = 'Dedent line' })
vim.keymap.set('v', '<C-l>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('v', '<C-h>', '<gv', { desc = 'Dedent selection' })
