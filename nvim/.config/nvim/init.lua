-- Thanks to https://githugtb.com/ThePrimeagen/init.lua for getting this going
require('paq-man').bootstrap(function()
	require 'colours'
	require 'map'
	require 'set'
	require 'netrw'
	-- The following would go in after/ but, erm, aren't
	require 'prefs.telescope'
	require 'prefs.undotree'
	require 'prefs.lsp-zero'
end)
