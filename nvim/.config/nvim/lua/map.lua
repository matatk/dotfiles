--vim.g.mapleader = ' '  -- Can't decide!

-- Inherited from Debian
vim.keymap.set('n', '<C-h>', vim.cmd.nohlsearch)

-- Make it easier to type commands
vim.keymap.set('n', ';', ':')


--
-- Movement
--

vim.keymap.set('n', '<C-d>', '<C-w><C-p>')

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


--
-- Window stuff
--

-- Go to previous window
vim.keymap.set('n', '<C-p>', '<C-w><C-p>')

-- Make window n chars wide
vim.keymap.set('n', '<C-7>', '<C-w>70|')
vim.keymap.set('n', '<C-8>', '<C-w>80|')

-- Close buffer without closing window
-- https://stackoverflow.com/a/4468491/1485308
vim.keymap.set('n', '<C-c>', ':bp|bd#<cr>')


--
-- Terminal stuff
--

-- Open new terminal in a vertical split
vim.keymap.set('n', '<Leader>t', ':vsp | term<CR>')

-- Escape to previous buffer
vim.keymap.set('t', '<esc>', '<C-\\><C-n><C-w><C-p>')
