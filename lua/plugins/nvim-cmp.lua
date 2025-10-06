return {
	-- add blink.compat
	{
		"saghen/blink.compat",
		-- use v2.* for blink.cmp v1.*
		version = "2.*",
		-- lazy.nvim will automatically load the plugin when it's required by blink.cmp
		lazy = true,
		-- make sure to set opts so that lazy.nvim calls blink.compat's setup
		opts = {
			debug = true,
		},
	},
	{
		"saghen/blink.cmp",

		-- optional: provides snippets for the snippet source
		dependencies = {
			{ "tzachar/cmp-tabnine" },
			{ "mgalliou/blink-cmp-tmux" },
			{ "moyiz/blink-emoji.nvim" },
			{ "disrupted/blink-cmp-conventional-commits" },
		},

		-- use a release tag to download pre-built binaries
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
				["<S-Tab>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "select_next", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			},
			completion = {
				documentation = { auto_show = true },
				menu = {
					-- Don't automatically show the completion menu
					auto_show = true,

					-- nvim-cmp style menu
					draw = {
						columns = {
							{ "label", "label_description", gap = 1 },
							{ "kind_icon", "kind" },
						},
					},
				},
				ghost_text = { enabled = true },
			},
			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					"emoji",
					"tmux",
					"conventional_commits",
					"cmp_tabnine",
				},
				per_filetype = {
					DressingInput = {}, -- disable autocomplete for NvimTree
				},
				providers = {
					cmp_tabnine = {
						name = "cmp_tabnine",
						module = "blink.compat.source",
						score_offset = 15,
						async = true,
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15, -- tune by preference
						opts = {
							insert = true, -- Insert emoji (default) or complete its name 🐛
							---@type string|table|fun():table
							trigger = function()
								return { ":" }
							end,
						},
						should_show_items = function()
							return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
						end,
					},
					tmux = {
						module = "blink-cmp-tmux",
						name = "tmux",
						-- default options
						opts = {
							all_panes = false,
							capture_history = false,
							-- only suggest completions from `tmux` if the `trigger_chars` are
							-- used
							triggered_only = false,
							trigger_chars = { "." },
						},
					},
					conventional_commits = {
						name = "Conventional Commits",
						module = "blink-cmp-conventional-commits",
						enabled = function()
							return vim.bo.filetype == "gitcommit"
						end,
						---@module 'blink-cmp-conventional-commits'
						---@type blink-cmp-conventional-commits.Options
						opts = {}, -- none so far
					},
				},
			},
		},
	},
}
