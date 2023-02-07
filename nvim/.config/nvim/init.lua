-- Thanks to https://githugtb.com/ThePrimeagen/init.lua for getting this going
require('paq-man').bootstrap(function()
	require('colours')
	require('map')
	require('set')
	require('netrw')
	-- The following would go in after/ but, erm, aren't
	require('prefs.telescope')

	-- LSP Zero
	-- https://github.com/VonHeikemen/lsp-zero.nvim/tree/v1.x#usage
	-- Learn the keybindings, see :help lsp-zero-keybindings
	-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
	local lsp = require('lsp-zero')
	lsp.preset('recommended')
	-- (Optional) Configure lua language server for neovim
	lsp.nvim_workspace()
	lsp.setup()
end)
