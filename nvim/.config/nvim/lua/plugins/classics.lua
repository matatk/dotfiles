return {
	'gpanders/editorconfig.nvim',  -- FIXME: Remove after nvim 0.9 is stable

	'tpope/vim-surround',

	{
		'mbbill/undotree',
		config = function()
			vim.keymap.set('n', '<leader>ut', function()
				vim.g.undotree_WindowLayout = 1
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end)
			vim.keymap.set('n', '<leader>uT', function()
				vim.g.undotree_WindowLayout = 3
				vim.cmd.UndotreeToggle()
				vim.cmd.UndotreeFocus()
			end)
		end
	}
}
