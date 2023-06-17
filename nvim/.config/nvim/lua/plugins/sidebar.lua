return {
	{
		'sidebar-nvim/sidebar.nvim',
		config = function()
			require("sidebar-nvim").setup({
				sections = { 'git', 'diagnostics', 'todos', 'symbols', 'files' },
				section_separator = "",
				bindings = {
					["q"] = function() require("sidebar-nvim").close() end
				}
			})

			vim.keymap.set('n', '<leader>s', vim.cmd.SidebarNvimToggle)
		end
	}
}
