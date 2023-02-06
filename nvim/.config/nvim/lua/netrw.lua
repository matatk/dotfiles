-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://shapeshed.com/vim-netrw/

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_liststyle = 3

vim.keymap.set('n', '<leader>ef', function() vim.cmd.Lexplore('%:p:h') end)
vim.keymap.set('n', '<leader>ew', vim.cmd.Lexplore)
