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
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
			vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
			vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
			vim.keymap.set('n', '<leader>fS', builtin.lsp_dynamic_workspace_symbols, {})

			vim.keymap.set('n', '<leader>fB', builtin.builtin, {})
		end
	}
}
