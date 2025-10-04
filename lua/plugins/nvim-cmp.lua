-- Auto-completion / Snippets
-- return {
--   -- https://github.com/hrsh7th/nvim-cmp
--   'hrsh7th/nvim-cmp',
--   event = 'InsertEnter',
--   dependencies = {
--     -- Snippet engine & associated nvim-cmp source
--     -- https://github.com/L3MON4D3/LuaSnip
--     'L3MON4D3/LuaSnip',
--     -- https://github.com/saadparwaiz1/cmp_luasnip
--     'saadparwaiz1/cmp_luasnip',

--     -- LSP completion capabilities
--     -- https://github.com/hrsh7th/cmp-nvim-lsp

--     'hrsh7th/cmp-nvim-lsp',

--     -- Additional user-friendly snippets
--     -- https://github.com/rafamadriz/friendly-snippets
--     'rafamadriz/friendly-snippets',
--     -- https://github.com/hrsh7th/cmp-buffer
--     'hrsh7th/cmp-buffer',
--     -- https://github.com/hrsh7th/cmp-path
--     'hrsh7th/cmp-path',
--     -- https://github.com/hrsh7th/cmp-cmdline
--     'hrsh7th/cmp-cmdline',
--     -- https://github.com/ray-x/cmp-treesitter
--     'ray-x/cmp-treesitter',
--     -- https://github.com/onsails/lspkind.nvim
--     'onsails/lspkind.nvim',
--     -- https://github.com/andersevenrud/cmp-tmux
--     'andersevenrud/cmp-tmux',
--     -- https://github.com/hrsh7th/cmp-emoji
--     'hrsh7th/cmp-emoji',
--   },
--   config = function()
--     local cmp = require('cmp')
--     local luasnip = require('luasnip')
--     require('luasnip.loaders.from_vscode').lazy_load({ paths = './my-snippets' })
--     luasnip.config.setup({})

--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           luasnip.lsp_expand(args.body)
--         end,
--       },
--       completion = {
--         completeopt = 'menu,menuone,noinsert',
--       },
--       mapping = cmp.mapping.preset.insert {
--         ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
--         ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
--         ['<C-b>'] = cmp.mapping.scroll_docs(-4),    -- scroll backward
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- scroll forward
--         ['<C-Space>'] = cmp.mapping.complete {},    -- show completion suggestions
--         ['<CR>'] = cmp.mapping.confirm {
--           behavior = cmp.ConfirmBehavior.Replace,
--           select = true,
--         },
--         -- Tab through suggestions or when a snippet is active, tab to the next argument
--         ['<Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expand_or_locally_jumpable() then
--             luasnip.expand_or_jump()
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--         -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
--         ['<S-Tab>'] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_prev_item()
--           elseif luasnip.locally_jumpable(-1) then
--             luasnip.jump(-1)
--           else
--             fallback()
--           end
--         end, { 'i', 's' }),
--       },
--       sources = cmp.config.sources({
--         { name = "nvim_lsp" },    -- lsp
--         { name = "luasnip" },     -- snippets
--         { name = "buffer" },      -- text within current buffer
--         { name = "path" },        -- file system paths
--         { name = "cmp_tabnine" }, -- tabnine (requires the Tabnine plugin)
--         { name = "treesitter" },  -- treesitter
--         -- {
--         --   name = "tmux",
--         --   option = {
--         --     all_panes = true,        --source from all panes in the current tmux session
--         --     capture_history = false, -- show completion suggestions from text in visible pane
--         --   }
--         -- },                           -- tmux completion (requires the tmux plugin)
--         { name = "emoji" },          -- emoji completion (requires the emoji plugin) 🐛
--       }),
--       formatting = {
--         format = require 'lspkind'.cmp_format {
--           mode = "symbol_text",
--           menu = {
--             nvim_lsp = "[LSP]",
--             buffer = "[Buffer]",
--             latex_symbols = "[Latex]",
--             luasnip = "[LuaSnip]",
--             treesitter = "[Treesitter]",
--             cmp_tabnine = "[Tabnine]",
--             tmux = "[Tmux]",
--             emoji = "[Emoji]",
--           }
--         }
--       },
--       window = {
--         -- Add borders to completions popups
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--     })
--   end,
-- }

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
			-- { 'L3MON4D3/LuaSnip' },
			-- { 'saadparwaiz1/cmp_luasnip' },
			-- { 'hrsh7th/cmp-nvim-lsp' },
			-- { 'rafamadriz/friendly-snippets' },
			-- { 'hrsh7th/cmp-cmdline' },
			-- { 'ray-x/cmp-treesitter' },
			{ "andersevenrud/cmp-tmux" },
			-- { 'hrsh7th/cmp-emoji' },
			{ "moyiz/blink-emoji.nvim" },
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
				default = { "lsp", "path", "snippets", "buffer", "emoji" },
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
							insert = true, -- Insert emoji (default) or complete its name 🧭
							---@type string|table|fun():table
							trigger = function()
								return { ":" }
							end,
						},
						should_show_items = function()
							return vim.tbl_contains({ "gitcommit", "markdown", "lua" }, vim.o.filetype)
						end,
					},
				},
			},
		},
	},
}
