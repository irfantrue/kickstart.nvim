-- =============================================================================
-- Line Movement (Normal mode)
-- Moves current line up/down and auto-indents with ==
-- =============================================================================
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==', { desc = 'Move line up' })

-- Line Movement (Visual mode)
-- Moves selection up/down and preserves selection with gv=gv
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- =============================================================================
-- Indentation (Normal & Visual mode)
-- =============================================================================
vim.keymap.set('n', '<C-l>', '>>', { desc = 'Indent line' })
vim.keymap.set('n', '<C-h>', '<<', { desc = 'Dedent line' })
vim.keymap.set('v', '<C-l>', '>gv', { desc = 'Indent selection' })
vim.keymap.set('v', '<C-h>', '<gv', { desc = 'Dedent selection' })
