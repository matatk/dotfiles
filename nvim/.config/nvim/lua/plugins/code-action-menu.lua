return {
	{
		'weilbith/nvim-code-action-menu',
		config = function()
			vim.keymap.set('n', '<leader>a', vim.cmd.CodeActionMenu)
		end
	}
}
