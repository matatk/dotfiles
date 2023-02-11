--vim.g.mapleader = ' '  -- Can't decide!

-- Inherited from Debian
vim.keymap.set('n', '<C-h>', vim.cmd.nohlsearch)

-- Make it easier to type commands
vim.keymap.set('n', ';', ':')

--
-- Terminal stuff
--

-- Based on https://gist.github.com/mahemoff/8967b5de067cffc67cec174cb3a9f49d#key-bindings
vim.keymap.set('n', '<Leader>t', ':vsp | term<CR>i')

-- TODO: Move?
-- https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
vim.api.nvim_create_autocmd('TermClose', {
	pattern = '*',
	command = 'bdelete! ' .. vim.fn.expand('<abuf>')
})
