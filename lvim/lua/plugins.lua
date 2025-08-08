------------------------------------------------------
-- Plugins
------------------------------------------------------
lvim.plugins = {
	-- TMUX navigator
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-|>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- NNN Explorer
	-- {
	-- 	"luukvbaal/nnn.nvim",
	-- 	config = function()
	-- 		-- require("nnn").setup()
	-- 		-- require("config.nnn").setup()
	-- 	end,
	-- },
	-- git blame
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			require("gitblame").setup({ enabled = true })
		end,
	},
	-- {
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("gitsigns").setup()
	-- 	end,
	-- },
	-- Surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	-- Glow Markdown preview
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	-- Load dotenv file variables
	{ "tpope/vim-dotenv" },
	-- repeat supported maps with "."
	{ "tpope/vim-repeat" },
	-- HTML tags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	-- LSP signature
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("lsp_signature").on_attach({
	-- 			floating_window = false,
	-- 			hint_prefix = "🐼 ",
	-- 		})
	-- 	end,
	-- },
	-- Draw ASCII diagrams in nvim
	{ "jbyuki/venn.nvim" },
	-- Enhanced movement plugin
	{
		"ggandor/leap.nvim",
		event = "BufRead",
		-- config = function()
		-- 	require("leap").create_default_mappings()
		-- end,
		dependencies = {
			"tpope/vim-repeat",
		},
	},
	-- Go development
	{
		"fatih/vim-go",
		build = ":GoUpdateBinaries",
	},
	-- Tabnine
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("config.tabnine").prefetch()
		end,
	},
	-- Copilot
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	config = function()
	-- 		require("config.copilot").setup()
	-- 	end,
	-- 	dependencies = {
	-- 		-- "github/copilot.vim",
	-- 		"zbirenbaum/copilot.lua",
	-- 		"AndreM222/copilot-lualine",
	-- 	},
	-- },
	-- Treesitter complements
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("config.treesitter_context").setup()
		end,
	},
	-- mkdir
	{ "pbrisbin/vim-mkdir" },
	-- Wakatime
	{ "wakatime/vim-wakatime" },
	-- Move like a spider
	{ "chrisgrieser/nvim-spider", lazy = true },
	-- Jump to the line
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
			})
		end,
	},
	-- TODO: comments
	-- NOTE: highlights comments on code
	-- BUG: error XD
	-- HACK: hack code
	-- PERF: to improve later
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()
		end,
	},
	-- autosession
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.persistence").setup()
		end,
	},
	-- Trouble
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	-- Noice CMD / Notifications / Signatures
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("config.noice").setup()
		end,
	},
	-- Fidget
	{
		"j-hui/fidget.nvim",
		opts = {
			integration = {
				["nvim-tree"] = {
					enable = false, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
				},
			},
		},
	},
	-- colorizer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("config.colorizer").setup()
		end,
	},
	-- telescope extensions
	{ "nvim-telescope/telescope-frecency.nvim" },
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("neoclip").setup()
		end,
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
	},
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
	},
	-- SQL LSP
	{ "nanotee/sqls.nvim" },
	-- Async run
	{ "skywind3000/asyncrun.vim" },
	{ "benmills/vimux" },
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function ()
	-- 		require("config.neotree").setup()
	-- 	end
	-- },
	{
		"ellisonleao/dotenv.nvim",
		config = function()
			require("dotenv").setup()
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("config.neotest").setup()
		end,
	},
	-- NOTE: THEMES
	--------------------------------------------------------------------
	{
		"diegoulloao/neofusion.nvim",
		config = function()
			require("config.neofusion").setup()
		end,
	},
	-- { "lunarvim/colorschemes" },
	-- { "catppuccin/nvim", name = "catppuccin" },
	-- { "folke/tokyonight.nvim", lazy = false, opts = {} },
	-- { "EdenEast/nightfox.nvim" },
	-- { "ellisonleao/gruvbox.nvim" },
	-- { "NTBBloodbath/doom-one.nvim" },
	-- { "NLKNguyen/papercolor-theme" },
	-- { "ayu-theme/ayu-vim" },
	-- { "cocopon/iceberg.vim" },
	-- { "neanias/everforest-nvim" },
	-- { "rebelot/kanagawa.nvim" },
	-- { "rose-pine/neovim", name = "rose-pine" },
	-- { "ntk148v/komau.vim" },
	-- {
	-- 	"jesseleite/nvim-noirbuddy",
	-- 	dependencies = {
	-- 		{ "tjdevries/colorbuddy.nvim" },
	-- 	},
	-- 	lazy = false,
	-- 	-- priority = 1000,
	-- 	opts = {
	-- 		-- All of your `setup(opts)` will go here
	-- 	},
	-- 	config = function()
	-- 		require("noirbuddy").setup({
	-- 			preset = "minimal",
	-- 			styles = {
	-- 				italic = true,
	-- 				bold = false,
	-- 				underline = false,
	-- 				undercurl = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}

------------------------------------------------------
-- Load custom configurations
------------------------------------------------------
require("config.big_file")
require("config.null_ls")
require("config.telescope")
require("config.lualine")
require("config.nvim_tree")
