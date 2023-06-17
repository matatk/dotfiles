-- TODO: decide if and how using
return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup {
			window = {
				width = 80
			}
		}

		-- Added by me
		-- TODO: make silent etc. and DRY that
		vim.keymap.set('n', '<Leader>z', vim.cmd.ZenMode)
	end
}
