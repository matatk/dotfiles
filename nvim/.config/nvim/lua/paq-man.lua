-- Exports a function to bootstrap Paq
-- Sets up an autocommand to update Paq when the plugins list changes
-- Based on https://github.com/savq/paq-nvim/issues/129 and subsequent PR

local plugins = require('plugins')

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
	paq(plugins)
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
	callback = function()
		package.loaded['plugins'] = nil
		local revised_plugins = require('plugins')
		local paq = require('paq')
		paq(revised_plugins)
		vim.cmd [[ silent PaqClean | silent PaqInstall ]]
	end,
	group = vim.api.nvim_create_augroup('Paq', { clear = true }),
	pattern = '*/plugins.lua'  -- FIXME non-absolute path
})

return { bootstrap = bootstrap }
