return {
  'neovim/nvim-lspconfig',
  event = { "BufReadPre", "BufNewFile", },
  dependencies = {
    { 'mason-org/mason.nvim' },
    { 'mason-org/mason-lspconfig.nvim' },
    { 'j-hui/fidget.nvim',             opts = {} },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'folke/neodev.nvim',             opts = {} },
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
        'ruff',
      },
      automatic_enable = true,
    })

    local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

    for name, icon in pairs(symbols) do
      local hl = "DiagnosticSign" .. name
      vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
    end

    -- Faster LSP startup
    vim.opt.updatetime = 250 -- Faster CursorHold trigger

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
