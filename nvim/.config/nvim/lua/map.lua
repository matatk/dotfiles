-- https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316
-- FIXME: this doesn't seem to do anything
vim.keymap.set('n', '<C-i>', function()
	print('Doing something to highlights...')
    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
      vim.api.nvim_set_hl(0, group, {})
    end
end)


-- Inherited from Debian
vim.keymap.set('n', '<C-h>', vim.cmd.nohlsearch)


--
-- Movement
--

-- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Similarly, keep the cursor vertically centred with these movements
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')


--
-- Window stuff
--

-- Go to previous window
vim.keymap.set('n', '<C-p>', '<C-w><C-p>')
vim.keymap.set('t', '<C-p>', '<C-\\><C-n><C-w><C-p>')

-- Window width shortcuts (the wider ones include a margin allowance)
vim.keymap.set('n', '<C-2>', '<C-w>20|')
vim.keymap.set('n', '<C-3>', '<C-w>30|')
vim.keymap.set('n', '<C-4>', '<C-w>40|')
vim.keymap.set('n', '<C-5>', '<C-w>50|')
vim.keymap.set('n', '<C-7>', '<C-w>75|')
vim.keymap.set('n', '<C-8>', '<C-w>85|')


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
