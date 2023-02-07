-- https://www.reddit.com/r/neovim/comments/srifm4/the_best_neovim_color_scheme_with_tree_sitter_and/

-- Molokai
-- https://github.com/tomasr/molokai
vim.g.rehash256 = 1
--vim.cmd.colorscheme('molokai')

-- One dark
-- https://github.com/navarasu/onedark.nvim#default-configuration
require('onedark').setup {
	style = 'warmer',
	toggle_style_key = '<leader>ts',
	toggle_style_list = { 'darker', 'deep', 'warmer' }
}
--require('onedark').load()

-- Rose Pine
-- FIXME unicode
-- https://github.com/rose-pine/neovim#options
--vim.cmd.colorscheme('rose-pine')

-- Tokyo Night
vim.cmd.colorscheme('tokyonight-night')
