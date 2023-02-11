-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://shapeshed.com/vim-netrw/
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3 -- tree

local function bind(from, to)
	vim.keymap.set('n', from, to, { silent = true, noremap = true })
end

bind('<leader>ef', ':Lexplore %:p:h<cr>|<C-w>20<bar><cr>') -- file's dir
bind('<leader>ew', ':Lexplore|<C-w>20<bar><cr>') -- cwd

-- https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	group = vim.api.nvim_create_augroup('better_netrw_mapping', { clear = true }),
	callback = function()
		vim.notify('hello from better netrw mappings')
		bind('Q', vim.cmd.bd) -- NOTE: Q's quicker than q due to other bindings.
	end
})
