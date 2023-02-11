return {
	--
	-- Not TreeSitter-supporting
	--

	-- Molokai
	{
		'tomasr/molokai',
		config = function()
			-- https://github.com/tomasr/molokai
			vim.g.rehash256 = true
		end
	},

	--
	-- TreeSitter-supporting
	--

	-- https://github.com/rockerBOO/awesome-neovim#colorscheme
	-- https://www.reddit.com/r/neovim/comments/srifm4/the_best_neovim_color_scheme_with_tree_sitter_and/

	{ 'morhetz/gruvbox' },

	{ 'dracula/vim' },

	{
		'folke/tokyonight.nvim',
		opts = { style = "night" }
	},

	{
		'navarasu/onedark.nvim',
		priority = 942,
		config = function()
			-- One dark
			-- https://github.com/navarasu/onedark.nvim#default-configuration
			require('onedark').setup {
				style = 'warmer',
				toggle_style_key = '<leader>os',
				toggle_style_list = { 'warmer', 'darker', 'deep' }
			}
			require('onedark').load()
		end
	},

	{
		'rose-pine/neovim',
		config = function()
			-- Rose Pine
			-- FIXME unicode
			-- https://github.com/rose-pine/neovim#options
		end
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
	},

	{
		'hzchirs/vim-material',
		config = function()
			-- vim-material
			-- https://github.com/hzchirs/vim-material
			vim.g.material_style = nil
			--vim.g.material_style = 'palenight'
			--vim.g.material_style = 'oceanic'
		end
	},
}
