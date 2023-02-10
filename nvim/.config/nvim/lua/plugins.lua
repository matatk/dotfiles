return {
	--
	-- Colours
	--

	-- Not TreeSitter-supporting?
	'tomasr/molokai',

	-- TreeSitter-supporting
	-- https://github.com/rockerBOO/awesome-neovim#colorscheme
	'morhetz/gruvbox',
	'folke/tokyonight.nvim',
	'navarasu/onedark.nvim',
	'rose-pine/neovim',
	'dracula/vim',

	-- https://github.com/material-theme/vsc-material-theme#official-portings
	{ 'kaicataldo/material.vim', branch = 'main' },
	'hzchirs/vim-material',

	--
	-- Classic bangin' Vim plugins
	--

	'tpope/vim-surround',
	'mbbill/undotree',

	--
	-- NeoVim plugins
	--

	-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation#packernvim
	{ 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
	{ 'nvim-treesitter/playground' },  -- TODO: depends on treesitter; express that here?

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',  -- TODO: tag = '0.1.2' ?
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		}
	},

	-- LSP Zero
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },             -- Required
			{ 'williamboman/mason.nvim' },           -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },         -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },     -- Required
			{ 'hrsh7th/cmp-buffer' },       -- Optional
			{ 'hrsh7th/cmp-path' },         -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },     -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },             -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}
}
