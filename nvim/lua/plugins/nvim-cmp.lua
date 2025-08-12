-- Auto-completion / Snippets
return {
  -- https://github.com/hrsh7th/nvim-cmp
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet engine & associated nvim-cmp source
    -- https://github.com/L3MON4D3/LuaSnip
    'L3MON4D3/LuaSnip',
    -- https://github.com/saadparwaiz1/cmp_luasnip
    'saadparwaiz1/cmp_luasnip',

    -- LSP completion capabilities
    -- https://github.com/hrsh7th/cmp-nvim-lsp

    'hrsh7th/cmp-nvim-lsp',

    -- Additional user-friendly snippets
    -- https://github.com/rafamadriz/friendly-snippets
    'rafamadriz/friendly-snippets',
    -- https://github.com/hrsh7th/cmp-buffer
    'hrsh7th/cmp-buffer',
    -- https://github.com/hrsh7th/cmp-path
    'hrsh7th/cmp-path',
    -- https://github.com/hrsh7th/cmp-cmdline
    'hrsh7th/cmp-cmdline',
    -- https://github.com/ray-x/cmp-treesitter
    'ray-x/cmp-treesitter',
    -- https://github.com/onsails/lspkind.nvim
    'onsails/lspkind.nvim',
    -- https://github.com/andersevenrud/cmp-tmux
    'andersevenrud/cmp-tmux',
    -- https://github.com/hrsh7th/cmp-emoji
    'hrsh7th/cmp-emoji',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load({ paths = './my-snippets' })
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),    -- scroll backward
        ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- scroll forward
        ['<C-Space>'] = cmp.mapping.complete {},    -- show completion suggestions
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        -- Tab through suggestions or when a snippet is active, tab to the next argument
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        -- Tab backwards through suggestions or when a snippet is active, tab to the next argument
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },    -- lsp
        { name = "luasnip" },     -- snippets
        { name = "buffer" },      -- text within current buffer
        { name = "path" },        -- file system paths
        { name = "cmp_tabnine" }, -- tabnine (requires the Tabnine plugin)
        { name = "treesitter" },  -- treesitter
        -- {
        --   name = "tmux",
        --   option = {
        --     all_panes = true,        --source from all panes in the current tmux session
        --     capture_history = false, -- show completion suggestions from text in visible pane
        --   }
        -- },                           -- tmux completion (requires the tmux plugin)
        { name = "emoji" },          -- emoji completion (requires the emoji plugin) 🐛
      }),
      formatting = {
        format = require 'lspkind'.cmp_format {
          mode = "symbol_text",
          menu = {
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            latex_symbols = "[Latex]",
            luasnip = "[LuaSnip]",
            treesitter = "[Treesitter]",
            cmp_tabnine = "[Tabnine]",
            tmux = "[Tmux]",
            emoji = "[Emoji]",
          }
        }
      },
      window = {
        -- Add borders to completions popups
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}


--return {
--  'saghen/blink.cmp',
--  -- optional: provides snippets for the snippet source
--  dependencies = { 'rafamadriz/friendly-snippets' },

--  -- use a release tag to download pre-built binaries
--  version = '1.*',
--  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
--  -- build = 'cargo build --release',
--  -- If you use nix, you can build from source using latest nightly rust with:
--  -- build = 'nix run .#build-plugin',

--  ---@module 'blink.cmp'
--  ---@type blink.cmp.Config
--  opts = {
--    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
--    -- 'super-tab' for mappings similar to vscode (tab to accept)
--    -- 'enter' for enter to accept
--    -- 'none' for no mappings
--    --
--    -- All presets have the following mappings:
--    -- C-space: Open menu or open docs if already open
--    -- C-n/C-p or Up/Down: Select next/previous item
--    -- C-e: Hide menu
--    -- C-k: Toggle signature help (if signature.enabled = true)
--    --
--    -- See :h blink-cmp-config-keymap for defining your own keymap
--    keymap = { preset = 'enter' },

--    appearance = {
--      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--      -- Adjusts spacing to ensure icons are aligned
--      nerd_font_variant = 'mono'
--    },

--    -- (Default) Only show the documentation popup when manually triggered
--    completion = { documentation = { auto_show = true } },

--    -- Default list of enabled providers defined so that you can extend it
--    -- elsewhere in your config, without redefining it, due to `opts_extend`
--    sources = {
--      default = { 'lsp', 'path', 'snippets', 'buffer' },
--    },

--    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
--    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
--    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
--    --
--    -- See the fuzzy documentation for more information
--    fuzzy = { implementation = "prefer_rust_with_warning" }
--  },
--  opts_extend = { "sources.default" }
--}
