-- Fuzzy finder
return {
	{
		-- https://github.com/nvim-telescope/telescope.nvim
		"nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = {
			-- https://github.com/nvim-lua/plenary.nvim
			{ "nvim-lua/plenary.nvim" },
			-- { "nvim-telescope/telescope-frecency.nvim" },
		},
		opts = {
			defaults = {
				layout_config = {
					vertical = {
						width = 0.75,
					},
				},
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
				preview = {
					mime_hook = function(filepath, bufnr, opts)
						local is_image = function(_filepath)
							local image_extensions = { "png", "jpg" } -- Supported image formats
							local split_path = vim.split(_filepath:lower(), ".", { plain = true })
							local extension = split_path[#split_path]
							return vim.tbl_contains(image_extensions, extension)
						end
						if is_image(filepath) then
							local term = vim.api.nvim_open_term(bufnr, {})
							local function send_output(_, data, _)
								for _, d in ipairs(data) do
									vim.api.nvim_chan_send(term, d .. "\r\n")
								end
							end
							vim.fn.jobstart({
								"catimg",
								filepath, -- Terminal image viewer command
							}, { on_stdout = send_output, stdout_buffered = true, pty = true })
						else
							require("telescope.previewers.utils").set_preview_message(
								bufnr,
								opts.winid,
								"Binary cannot be previewed"
							)
						end
					end,
				},
			},
		},
	},
	{
		-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		-- cond = function()
		-- 	return vim.fn.executable("make") == 1
		-- end,
		config = function(_, opts)
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	},
	{
		-- https://github.com/nvim-telescope/telescope-frecency.nvim
		"nvim-telescope/telescope-frecency.nvim",
		-- install the latest stable version
		version = "*",
		config = function(_, opts)
			require("telescope-frecency").setup({
				db_safe_mode = false,
				matcher = "fuzzy",
				-- scoring_function = function(recency, fzy_score)
				-- 	return -recency
				-- end,
			})
			require("telescope").load_extension("frecency")
		end,
	},
	{
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			-- you'll need at least one of these
			{ "nvim-telescope/telescope.nvim" },
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require("neoclip").setup()
			require("telescope").load_extension("neoclip")
		end,
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		lazy = true,
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("media_files").setup()
			require("telescope").load_extension("media_files")
			require("telescope").setup({
				extensions = {
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
			})
		end,
	},
}
