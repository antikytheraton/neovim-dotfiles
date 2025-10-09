return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile", },
  dependencies = {
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
    {
      'j-hui/fidget.nvim',
      opts = {
        -- Add 'NvimTree' to the 'notification.window.avoid' list to ensure Fidget continues to avoid nvim-tree.lua's file explorer.
        notification = {
          window = {
            avoid = { 'NvimTree', 'DressingInput' }
          }
        }
      }
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'folke/neodev.nvim',     opts = {} },
    { 'aquasecurity/vim-tfsec' },
    { 'saghen/blink.cmp' },
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'lua_ls',
        'jsonls',
        'lemminx',
        'marksman',
        'quick_lint_js',
        'yamlls',
        -- 'pyright',
        'basedpyright',
        -- 'pyrefly',
        'gopls',
        'ruff',
        -- 'tfsec',
      },
      automatic_enable = true,
    })
    -- Faster LSP startup
    vim.opt.updatetime = 250 -- Faster CursorHold trigger
    local capabilities = require('blink.cmp').get_lsp_capabilities()

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
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
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
    vim.lsp.config('basedpyright', {
      capabilities = capabilities,
    })

    -- vim.lsp.config('tfsec', {
    --   capabilities = capabilities,
    -- })
    -- vim.lsp.config('gopls', {
    --   capabilities = capabilities,
    -- })

    -- vim.print(vim.lsp.config['tflint'])
    -- vim.print(vim.lsp.config['terraformls'])

    -- vim.lsp.config('terraformls', {
    --   settings = {}
    -- })

    -- vim.lsp.config('basedpyright', {
    --   settings = {
    --     pyright = {
    --       -- Using Ruff's import organizer
    --       disableOrganizeImports = true,
    --     },
    --     python = {
    --       analysis = {
    --         -- Ignore all files for analysis to exclusively use Ruff for linting
    --         ignore = { '*' },
    --       },
    --     },
    --   },
    -- })
    vim.lsp.config('ruff', {
      capabilities = capabilities,
      init_options = {
        settings = {
          -- Ruff language server settings go here
        }
      }
    })
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == 'ruff' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = 'LSP: Disable hover capability from Ruff',
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
