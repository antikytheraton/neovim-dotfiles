return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Improve startup time
    use("lewis6991/impatient.nvim")

    -- Improved Typescript lsp config
    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    -- LSP installer
    use({
        "williamboman/nvim-lsp-installer",
        config = function()
            require("nvim-lsp-installer").setup()
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lspconfig")
        end,
        after = { "nvim-cmp", "nvim-lsp-ts-utils", "nvim-lsp-installer" },
    })

    -- Nicer diagnostics
    use({
        "folke/lsp-trouble.nvim",
        config = function()
            require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
        end,
    })
    use("folke/lsp-colors.nvim")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("config.null_ls").setup()
        end,
    })

    -- Better code action menu
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })

    -- Nicer code action signs
    use("kosayoda/nvim-lightbulb")

    -- Misc
    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nathom/filetype.nvim")
    use("tmux-plugins/vim-tmux-focus-events")
    use("christoomey/vim-tmux-navigator")
    use("wakatime/vim-wakatime")
    use("Yggdroot/indentLine")
    use("pbrisbin/vim-mkdir")
    use("tpope/vim-surround")
    use("tpope/vim-sensible")

    -- Which key shortcuts helper
    use({
        "folke/which-key.nvim",
        config = function()
            require("config.which-key").setup()
        end,
    })

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    })

    -- Asynctasks
    use("skywind3000/asyncrun.vim")
    use("skywind3000/asynctasks.vim")

    -- Comment toggler
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("config.comment").setup()
        end,
    })

    -- Setting the commentstring based on the cursor location in a file
    use("JoosepAlviste/nvim-ts-context-commentstring")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter").setup()
        end,
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-context")

    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_session_suppress_dirs = { "~/", "~/Projects" },
            })
        end,
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

    -- Go development
    use({
        "fatih/vim-go",
        run = ":GoUpdateBinaries",
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
    -- use({
    -- 	"EdenEast/nightfox.nvim",
    -- 	config = function()
    -- 		require("config.nightfox").setup()
    -- 	end,
    -- 	run = ':lua require("nightfox").compile()',
    -- })
    -- material
    use({
        "marko-cerovac/material.nvim",
        config = function()
            require("config.material_theme").setup()
        end,
    })

    -- Status bar
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine").setup()
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        -- after = { "nvim-gps", "nightfox.nvim" },
        after = { "nvim-gps", "material.nvim" },
    })
    -- use({
    -- 	"windwp/windline.nvim",
    -- 	config = function()
    -- 		-- require("wlsample.evil_line")
    -- 		require("wlsample.bubble2")
    -- 	end,
    -- })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("config.gitsigns").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        run = "cd app && yarn install",
    })

    -- Git fugitive
    use("tpope/vim-fugitive")

    -- Lazygit in Neovim
    use("kdheepak/lazygit.nvim")

    -- Git blame
    use("f-person/git-blame.nvim")

    -- Check git history
    use("sindrets/diffview.nvim")

    -- File manager
    use({
        "luukvbaal/nnn.nvim",
        config = function()
            require("config.nnn").setup()
        end,
    })

    -- Highlight todo comments
    use({
        "folke/todo-comments.nvim",
        config = function()
            require("config.todo").setup()
        end,
        requires = "nvim-lua/plenary.nvim",
    })

    -- Terminal
    use({
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("config.terminal").setup()
        end,
    })
    use({
        "voldikss/vim-floaterm",
    })

    -- Fuzzy filtering
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("config.telescope").setup()
        end,
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        config = function()
            require("telescope").load_extension("fzf")
        end,
        requires = { { "nvim-telescope/telescope.nvim" } },
        run = "make",
    })

    -- Clipboard management
    use({
        "AckslD/nvim-neoclip.lua",
        config = function()
            require("config.neoclip").setup()
        end,
        requires = {
            { "nvim-telescope/telescope.nvim" },
            { "tami5/sqlite.lua" },
        },
    })

    -- Enhanced movement plugin
    use({
        "ggandor/lightspeed.nvim",
    })

    -- HTTP client in Neovim
    use({
        "NTBBloodbath/rest.nvim",
        config = function()
            require("config.rest").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
        ft = { "http" },
    })

    -- Color highlighter
    use({
        "norcalli/nvim-colorizer.lua",
        cmd = { "ColorizerToggle" },
        config = function()
            require("colorizer").setup()
        end,
        ft = { "html", "css", "json", "yaml", "conf" },
    })
end)
