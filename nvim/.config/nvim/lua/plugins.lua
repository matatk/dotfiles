-- Based on https://github.com/savq/paq-nvim/issues/129

local packages = {
	'savq/paq-nvim',

	'tpope/vim-surround',

	{ 'nvim-lua/plenary.nvim', tag='0.1.2' },

	{ 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
	{ 'nvim-telescope/telescope.nvim', branch='0.1.x' },
}

local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
local first_install = false

if vim.fn.glob(path) == "" then
	first_install = true
	vim.fn.system({ 'git', 'clone', 'https://github.com/savq/paq-nvim', path })
	vim.cmd.packadd('paq-nvim')
end

local function bootstrap(cb)
	local paq = require('paq')
	paq(packages)
	if first_install then
		print('Paq: first install, plugins being installed, if prompted hit Enter to continue.')
		vim.api.nvim_create_autocmd('User PaqDoneInstall', {
			callback = cb
		})
		paq.install()
	else
		cb()
	end
end

vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'silent PaqClean | silent PaqInstall',
	group = vim.api.nvim_create_augroup('Paq', { clear = true }),
	pattern = 'plugins.lua'  -- FIXME non-absolute path
})

return { bootstrap = bootstrap }
