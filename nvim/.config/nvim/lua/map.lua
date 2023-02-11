--vim.g.mapleader = ' '  -- Can't decide!

-- Inherited from Debian
vim.keymap.set('n', '<C-h>', vim.cmd.nohlsearch)

-- Make it easier to type commands
vim.keymap.set('n', ';', ':')


--
-- Terminal stuff
--

-- Go to previous window
vim.keymap.set('n', '<C-p>', '<C-w><C-p>')


--
-- Terminal stuff
--

-- Open new terminal in a vertical split
vim.keymap.set('n', '<Leader>t', ':vsp | term<CR>')

-- Escape to previous buffer
vim.keymap.set('t', '<esc>', '<C-\\><C-n><C-w><C-p>')
