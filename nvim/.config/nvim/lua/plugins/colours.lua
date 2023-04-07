return {
	-- https://github.com/rockerBOO/awesome-neovim#colorscheme
	-- https://www.reddit.com/r/neovim/comments/srifm4/the_best_neovim_color_scheme_with_tree_sitter_and/

	{ 'dracula/vim' },

	{
		'folke/tokyonight.nvim',
		opts = { style = "night" }
	},

	-- https://github.com/material-theme/vsc-material-theme#official-portings
	{
		'kaicataldo/material.vim',
		branch = 'main',
		config = function()
			vim.g.material_terminal_italics = true
			--vim.g.material_theme_style = 'darker'
			vim.g.material_theme_style = 'ocean'
			vim.cmd.colorscheme 'material'
		end
	}
}
