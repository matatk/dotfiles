-- https://www.reddit.com/r/neovim/comments/srifm4/the_best_neovim_color_scheme_with_tree_sitter_and/

-- Molokai
-- https://github.com/tomasr/molokai
vim.g.rehash256 = true
--vim.cmd.colorscheme('molokai')

-- One dark
-- https://github.com/navarasu/onedark.nvim#default-configuration
require('onedark').setup {
	style = 'warmer',
	toggle_style_key = '<leader>ts',
	toggle_style_list = { 'warmer', 'darker', 'deep' }
}
--require('onedark').load()

-- Rose Pine
-- FIXME unicode
-- https://github.com/rose-pine/neovim#options
--vim.cmd.colorscheme('rose-pine')

-- Tokyo Night
--vim.cmd.colorscheme('tokyonight-night')

-- material.vim
-- https://github.com/kaicataldo/material.vim
vim.g.material_terminal_italics = true
vim.g.material_theme_style = 'darker'
vim.g.material_theme_style = 'ocean'
vim.cmd.colorscheme('material')

-- vim-material
-- https://github.com/hzchirs/vim-material
vim.g.material_style = nil
--vim.g.material_style = 'palenight'
--vim.g.material_style = 'oceanic'
--vim.cmd.colorscheme('vim-material')
