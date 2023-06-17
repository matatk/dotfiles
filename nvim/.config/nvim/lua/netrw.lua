-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
-- https://shapeshed.com/vim-netrw/
vim.g.netrw_banner = false
vim.g.netrw_liststyle = 3 -- tree

local function bind(from, to)
	vim.keymap.set('n', from, to, { silent = true, noremap = true })
end

-- TODO: the first one of these doesn't toggle
bind('<leader>ef', function() vim.cmd.Lexplore '%:p:h' end) -- file's dir
bind('<leader>ew', vim.cmd.Lexplore) -- cwd

-- https://alpha2phi.medium.com/neovim-for-beginners-lua-autocmd-and-keymap-functions-3bdfe0bebe42
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'netrw',
	group = vim.api.nvim_create_augroup('better_netrw_mapping', { clear = true }),
	callback = function()
		vim.cmd [[ :vert resize 20 ]]
		bind('Q', vim.cmd.bd) -- NOTE: Q's quicker than q due to other bindings.
	end
})
