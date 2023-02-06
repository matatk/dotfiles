-- Can't decide!
-- vim.g.mapleader = ' '

-- Inherited from Debian
vim.keymap.set('n', '<C-h>', vim.cmd.nohlsearch)

-- Buffer navigation
-- https://stackoverflow.com/q/5559029/1485308
-- https://stackoverflow.com/a/103590/1485308
-- NOTE: <C-6> switches to the previously-used buffer.
-- TODO: Remove in favour of Telescope?
vim.keymap.set('n', '<leader>l', ':buffers<cr>:b<space>')
vim.keymap.set('n', '<leader>n', vim.cmd.bnext)
vim.keymap.set('n', '<leader>p', vim.cmd.bprev)
