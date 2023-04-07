return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup { position = "left" }

			vim.keymap.set("n", "<leader>xL", function() require("trouble").setup { position = "left" } end,
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xB", function() require("trouble").setup { position = "bottom" } end,
				{ silent = true, noremap = true }
			)

			-- https://github.com/folke/trouble.nvim#commands
			vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
				{ silent = true, noremap = true }
			)
			vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
				{ silent = true, noremap = true }
			)
		end
	}
}
