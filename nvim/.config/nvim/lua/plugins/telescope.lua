return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim', -- TODO: tag = '0.1.2' ?
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		}
	}
}
