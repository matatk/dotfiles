return {
	-- https://github.com/rockerBOO/awesome-neovim#colorscheme
	-- https://www.reddit.com/r/neovim/comments/srifm4/the_best_neovim_color_scheme_with_tree_sitter_and/

	-- Semantic highlighting:
	-- * https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/?utm_source=share&utm_medium=web2x&context=3
	-- * https://gist.github.com/swarn/fb37d9eefe1bc616c2a7e476c0bc0316

	--
	-- Material
	--

	-- https://github.com/material-theme/vsc-material-theme#official-portings

	-- NOTE: Doesn't support semantic highlighting
	-- https://github.com/kaicataldo/material.vim
	{
		'kaicataldo/material.vim',
		branch = 'main',
		config = function()
			vim.g.material_terminal_italics = true
			vim.g.material_theme_style = 'ocean'
			vim.cmd.colorscheme 'material'
		end
	},

	-- NOTE: Doesn't support semantic highlighting
	-- https://github.com/hzchirs/vim-material
	{
		'hzchirs/vim-material',
		config = function()
			vim.g.material_style = 'oceanic'
			vim.cmd.colorscheme 'vim-material'
		end
	},

	-- Other Material plugin
	-- This one can chnage variant via Telescope, but doesn't use any red in Rust
	-- https://github.com/marko-cerovac/material.nvim
	'marko-cerovac/material.nvim',

	--
	-- Others
	--

	{
		'folke/tokyonight.nvim',
		opts = { style = "night" }
	},

	-- https://github.com/navarasu/onedark.nvim
	{
		'navarasu/onedark.nvim',
		config = function()
			require('onedark').setup {
				style = 'warmer',
				toggle_style_key = '<C-o>'
			}
			require('onedark').load()
		end
	},

	-- https://github.com/sainnhe/gruvbox-material/
	{
		'sainnhe/gruvbox-material',
		config = function()
			vim.g.gruvbox_material_background = 'hard'
			vim.cmd.colorscheme("gruvbox-material")
		end
	},

	-- https://github.com/catppuccin/nvim
	'catppuccin/nvim',
}
