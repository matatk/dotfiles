-- Based on https://github.com/savq/paq-nvim/issues/129 and subsequent PR

local packages = {
	'savq/paq-nvim',

	'tomasr/molokai',
	'folke/tokyonight.nvim',
	'morhetz/gruvbox',
	'navarasu/onedark.nvim',
	'rose-pine/neovim',

	'tpope/vim-surround',

	{ 'nvim-lua/plenary.nvim', tag='0.1.2' },

	{ 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
	{ 'nvim-telescope/telescope.nvim', branch='0.1.x' },
}

local function ensure_paq()
	path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
	if vim.fn.glob(path) == "" then
		vim.fn.system({ 'git', 'clone', 'https://github.com/savq/paq-nvim', path })
		vim.cmd.packadd('paq-nvim')
		return true
	end
	return false
end

local function bootstrap(cb)
	first_install = ensure_paq()
	paq = require('paq')
	paq(packages)
	if first_install then
		print('Paq: first install; if prompted, hit Enter to continue.')
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
	pattern = '*/plugins.lua'  -- FIXME non-absolute path
})

return { bootstrap = bootstrap }
