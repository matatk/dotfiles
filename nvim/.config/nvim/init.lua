-- Thanks to https://githugtb.com/ThePrimeagen/init.lua for getting this going
require('plugins').bootstrap(function()
	require('colours')
	require('map')
	require('set')
	require('netrw')
	-- The following would go in after/ but, erm, aren't
	require('prefs.telescope')
end)
