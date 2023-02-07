return {
	'savq/paq-nvim',

	-- Colours: Not TreeSitter-supporting?
	'tomasr/molokai',

	-- Colours: TreeSitter-supporting
	-- https://github.com/rockerBOO/awesome-neovim#colorscheme
	'morhetz/gruvbox',
	'folke/tokyonight.nvim',
	'navarasu/onedark.nvim',
	'rose-pine/neovim',
	'dracula/vim',
	--{ 'kaicataldo/material.vim', branch='main' },  -- Removed in favour of...
	'marko-cerovac/material.nvim',

	-- Classic bangin' ViM plugins
	'tpope/vim-surround',

	-- so
	{ 'nvim-lua/plenary.nvim', tag='0.1.2' },

	-- NeoVim plugins
	{ 'nvim-telescope/telescope-fzf-native.nvim', run='make' },
	{ 'nvim-telescope/telescope.nvim', branch='0.1.x' },
}
