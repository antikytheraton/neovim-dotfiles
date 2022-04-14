return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Improve startup time
	use("lewis6991/impatient.nvim")

	-- Improved Typescript lsp config
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
		after = { "nvim-cmp", "nvim-lsp-ts-utils" },
	})

	-- Nicer diagnostics
	use({
		"folke/lsp-trouble.nvim",
		config = function()
			require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
		end,
	})

	-- Better code action menu
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})

	-- Nicer code action signs
	use("kosayoda/nvim-lightbulb")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter").setup()
		end,
		run = ":TSUpdate",
	})

	-- Snippets
	use({
		"L3MON4D3/LuaSnip",
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	})

	-- VSCode-like pictograms for neovim lsp completion items
	use("onsails/lspkind-nvim")

	-- Completion & Snippets
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-emoji")
	use("andersevenrud/cmp-tmux")
	use("octaltree/cmp-look")
	use("mtoohey31/cmp-fish")
	use({
		"hrsh7th/nvim-cmp",
		after = {
			"lspkind-nvim",
			"LuaSnip",
			"cmp_luasnip",
			"cmp-nvim-lua",
			"cmp-nvim-lsp",
			"cmp-buffer",
			"cmp-path",
			"cmp-cmdline",
			"cmp-tmux",
			"cmp-look",
			"cmp-calc",
			"cmp-fish",
			"cmp-emoji",
		},
		config = function()
			require("config.cmp").setup()
		end,
	})

	-- Misc
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nathom/filetype.nvim")
	use("tmux-plugins/vim-tmux-focus-events")
	use("christoomey/vim-tmux-navigator")


	-- Status bar
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("config.lualine").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		--after = { "nvim-gps", "nightfox.nvim" },
		after = { "nvim-gps", "material.nvim" },
	})

	-- Show scope in status bar
	use({
		"SmiteshP/nvim-gps",
		config = function()
			require("nvim-gps").setup()
		end,
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Colorscheme
	-- nightfox
	--	use({
	--		"EdenEast/nightfox.nvim",
	--		config = function()
	--			require("config.nightfox").setup()
	--		end,
	--		run = ':lua require("nightfox").compile()',
	--	})
	-- material
	use({
		"marko-cerovac/material.nvim",
		config = function()
			require("config.material_theme").setup()
		end,
	})

end)
