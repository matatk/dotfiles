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

-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.keymap.set('n', '<leader>ef', function() vim.cmd.Lexplore('%:p:h') end)
vim.keymap.set('n', '<leader>ew', vim.cmd.Lexplore)

-- https://github.com/nvim-telescope/telescope.nvim#usage
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', builtin.planets, {})
