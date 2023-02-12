-- FIXME: make a bind() that does silent and noremap

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
vim.keymap.set('t', '<C-p>', '<C-\\><C-n><C-w><C-p>')

-- Make window n chars wide
vim.keymap.set('n', '<C-2>', '<C-w>20|')
vim.keymap.set('n', '<C-3>', '<C-w>30|')
vim.keymap.set('n', '<C-7>', '<C-w>70|')
vim.keymap.set('n', '<C-8>', '<C-w>80|')

-- Close buffer without closing window
-- https://stackoverflow.com/a/4468491/1485308
vim.keymap.set('n', '<C-c>', ':bp|bd#<cr>')


--
-- Terminal stuff
--

-- https://www.reddit.com/r/neovim/comments/5usi1q/comment/ddwy6en/?utm_source=reddit&utm_medium=web2x&context=3

-- Open new terminal in a vertical split
vim.keymap.set('n', '<Leader>t', ':vsp | term<CR>')

-- Escape to normal mode (overriding the shell on purpose)
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')

-- Allow normal window movement commands
vim.keymap.set('t', '<C-w>h', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-w>j', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-w>k', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-w>l', '<C-\\><C-n><C-w>l')
