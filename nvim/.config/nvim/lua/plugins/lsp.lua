return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		},
		config = function()
			-- https://github.com/VonHeikemen/lsp-zero.nvim/tree/v1.x#usage
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#default-keybindings
			-- Infused with https://github.com/neovim/nvim-lspconfig
			-- Learn the keybindings, see :help lsp-zero-keybindings
			-- Learn to configure LSP servers, see :help lsp-zero-api-showcase

			local lsp = require('lsp-zero')
			lsp.preset('recommended')

			lsp.set_preferences({
				set_lsp_keymaps = { omit = { '<F2>', '<F4>' } }
			})

			lsp.on_attach(function(client, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }
				local bind = vim.keymap.set

				bind('n', '<leader>r', function() vim.lsp.buf.rename() end, opts)
				bind('n', '<leader>a', function() vim.lsp.buf.code_action() end, opts)
				bind('n', '<leader>F', function()
					print(vim.inspect(vim.lsp.buf.format { async = true }))
				end, opts)
				bind('n', '<leader>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
			end)

			-- (Optional) Configure lua language server for neovim
			lsp.nvim_workspace()
			lsp.setup() -- FIXME: causes error on first install
		end
	}
}
