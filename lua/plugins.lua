return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- Improve startup time
    use("lewis6991/impatient.nvim")

    -- LSP installer
    use({
        "williamboman/mason.nvim",
        run = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("config.mason").config()
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("config.lspconfig")
        end,
        after = { "nvim-cmp", "mason.nvim" },
    })

    -- Nicer diagnostics
    use({
        "folke/lsp-trouble.nvim",
        config = function()
            require("trouble").setup({ auto_preview = false, auto_fold = true, auto_close = true })
        end,
    })

    -- Color highlighter
    -- use("folke/lsp-colors.nvim")
    use({
        "NvChad/nvim-colorizer.lua",
        config = function()
            require("config.colorizer").setup()
        end,
    })

    -- Diagnostics
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
    use("pbrisbin/vim-mkdir")
    use("tpope/vim-surround")
    use("tpope/vim-sensible")
    use("tpope/vim-dotenv")
    use("tpope/vim-fugitive")

    -- Which key shortcuts helper
    use({
        "folke/which-key.nvim",
        config = function()
            require("config.which-key").setup()
        end,
    })

    -- Indent lines
    use("lukas-reineke/indent-blankline.nvim")

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
        "lewis6991/spellsitter.nvim",
        config = function()
            require("spellsitter").setup()
        end,
    })

    use({
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                -- auto_session_suppress_dirs = { "~/Downloads", "/" },
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

    -- Enhanced wildmenu
    -- use({
    --     "gelguy/wilder.nvim",
    --     config = function()
    --         require("config.wilder").setup()
    --     end,
    -- })

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
    -- use({
    --     "NTBBloodbath/doom-one.nvim",
    --     setup = function()
    --         -- Add color to cursor
    --         vim.g.doom_one_cursor_coloring = true
    --         -- Set :terminal colors
    --         vim.g.doom_one_terminal_colors = true
    --         -- Enable italic comments
    --         vim.g.doom_one_italic_comments = true
    --         -- Enable TS support
    --         vim.g.doom_one_enable_treesitter = true
    --         -- Color whole diagnostic text or only underline
    --         vim.g.doom_one_diagnostics_text_color = false
    --         -- Enable transparent background
    --         vim.g.doom_one_transparent_background = false
    --
    --         -- Pumblend transparency
    --         vim.g.doom_one_pumblend_enable = false
    --         vim.g.doom_one_pumblend_transparency = 20
    --
    --         -- Plugins integration
    --         vim.g.doom_one_plugin_neorg = true
    --         vim.g.doom_one_plugin_barbar = false
    --         vim.g.doom_one_plugin_telescope = false
    --         vim.g.doom_one_plugin_neogit = true
    --         vim.g.doom_one_plugin_nvim_tree = true
    --         vim.g.doom_one_plugin_dashboard = true
    --         vim.g.doom_one_plugin_startify = true
    --         vim.g.doom_one_plugin_whichkey = true
    --         vim.g.doom_one_plugin_indent_blankline = true
    --         vim.g.doom_one_plugin_vim_illuminate = true
    --         vim.g.doom_one_plugin_lspsaga = false
    --     end,
    --     config = function()
    --         vim.cmd("colorscheme doom-one")
    --     end,
    -- })

    -- Status bar
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("config.lualine.evil_lualine").setup()
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        -- after = { "nvim-gps", "nightfox.nvim" },
        after = { "nvim-gps", "material.nvim" },
    })

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

    -- Lazygit in Neovim
    use("kdheepak/lazygit.nvim")

    -- Git blame
    -- use("f-person/git-blame.nvim")

    -- Check git history
    use("sindrets/diffview.nvim")

    -- -- File manager
    use({
        "luukvbaal/nnn.nvim",
        config = function()
            require("config.nnn").setup()
            -- require("nnn").setup()
        end,
    })
    -- use({
    --     "kyazdani42/nvim-tree.lua",
    --     config = function()
    --         require("config.nvim-tree").setup()
    --     end,
    --     requires = {
    --         "kyazdani42/nvim-web-devicons", -- optional, for file icon
    --     },
    --     tag = "nightly", -- optional, updated every week. (see issue #1193)
    -- })

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

    use({
        "ziontee113/syntax-tree-surfer",
        config = function()
            require("config.sts").setup()
        end,
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

    -- Enhanced search and replace
    use({
        "windwp/nvim-spectre",
        config = function()
            require("config.spectre").setup()
        end,
    })

    -- Standalone UI for nvim-lsp progress
    use({
        "j-hui/fidget.nvim",
        config = function()
            -- require("fidget").setup({})
            require("config.fidget").setup()
        end,
    })

    -- use({ "glepnir/dashboard-nvim" })

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs").setup()
        end,
        after = { "nvim-cmp" },
    })

    -- Using mini.nvim for surround text object plugin and trailing space detection
    use({
        "echasnovski/mini.nvim",
        config = function()
            require("config.mini").setup()
        end,
    })

    use({
        "nvim-neotest/neotest",
        config = function()
            require("config.neotest").setup()
        end,
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-neotest/neotest-go",
            "nvim-neotest/neotest-python",
        }
    })
end)
