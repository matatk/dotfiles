vim.opt.colorcolumn = { 80, 90, 100 }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.scrolloff = 4
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.splitright = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.api.nvim_create_autocmd('TermOpen', {
	pattern = '*',
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
		vim.cmd.startinsert()
	end
})

vim.api.nvim_create_autocmd('TermClose', {
	pattern = '*',
	command = 'bdelete! ' .. vim.fn.expand('<abuf>')
})
