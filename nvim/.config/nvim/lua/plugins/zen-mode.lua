-- TODO: decide if and how using
return {
	"folke/zen-mode.nvim",
	config = function()
		local core = function(columns)
			require("zen-mode").toggle {
				window = {
					width = columns
				}
			}
		end

		-- Added by me
		-- TODO: make silent etc. and DRY that
		vim.keymap.set('n', '<Leader>z8', function() core(80) end)
		vim.keymap.set('n', '<Leader>z9', function() core(90) end)
		vim.keymap.set('n', '<Leader>z1', function() core(100) end)
	end
}
