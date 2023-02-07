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

-- Material
-- https://github.com/kaicataldo/material.vim
-- NOTE: THIS WAS REMOVED
--vim.g.material_terminal_italics = true
--vim.g.material_theme_style = 'darker'
--vim.cmd.colorscheme('material')

-- Material
-- https://github.com/marko-cerovac/material.nvim
vim.g.material_style = 'deep ocean'
vim.cmd.colorscheme('material')
vim.keymap.set('n', '<leader>fs', 
	function() require("material.functions").find_style() 
end)
