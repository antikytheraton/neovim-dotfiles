-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    -- https://github.com/williamboman/mason.nvim
    { 'mason-org/mason.nvim' },
    -- https://github.com/williamboman/mason-lspconfig.nvim
    { 'mason-org/mason-lspconfig.nvim' },
    -- 'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP
    -- https://github.com/j-hui/fidget.nvim
    { 'j-hui/fidget.nvim', opts = {} },

    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',

    -- Additional lua configuration, makes nvim stuff amazing!
    -- https://github.com/folke/neodev.nvim
    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        -- 'bashls', -- requires npm to be installed
        -- 'cssls', -- requires npm to be installed
        -- 'html', -- requires npm to be installed
        'lua_ls',
        -- 'jsonls', -- requires npm to be installed
        'lemminx',
        'marksman',
        'quick_lint_js',
        -- 'tsserver', -- requires npm to be installed
        -- 'yamlls', -- requires npm to be installed
        -- 'basedpyright',
        'pyright',
        'ruff',
        -- 'reorder-python-imports',
        -- 'terraformls',
      },
      automatic_enable = true,
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = {
              'vim',
              'require',
            },
          },
        },
      },
    })

    vim.lsp.config('dartls', {
      on_attach = function(client, bufnr)
        -- Your custom LSP key mappings and on_attach logic for dartls
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end
        -- Add specific key mappings for dartls if needed
        map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
        -- Add other dartls specific key mappings here if needed
      end,
    })

    -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded" -- Set border to rounded
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end
}
