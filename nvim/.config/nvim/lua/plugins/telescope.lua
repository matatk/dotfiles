return {
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim', -- TODO: tag = '0.1.2' ?
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').load_extension('fzf')

			-- https://github.com/nvim-telescope/telescope.nvim#usage
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, {})

			vim.keymap.set('n', '<leader>sk', builtin.keymaps, {})
			vim.keymap.set('n', '<leader>sB', builtin.builtin, {})
			vim.keymap.set('n', '<leader>sc', builtin.colorscheme, {})
		end
	}
}
