return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-x>"] = actions.delete_buffer,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						"pnpm-lock",
						".git",
						".sl",
						"_build",
						".next",
					},
					hidden = true,
					path_display = {
						"filename_first",
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
						previewer = false,
					},
					live_grep = {
						theme = "ivy",
						previewer = true,
					},
					oldfiles = {
						theme = "ivy",
						previewer = false,
					},
					buffers = {
						theme = "ivy",
						previewer = false,
					},
					lsp_document_symbols = {
						theme = "ivy",
						previewer = true,
					},
				},
			})
		end,
	},
}
