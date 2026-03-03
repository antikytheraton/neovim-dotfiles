return {
  'nvim-flutter/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',     -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup {
      -- Add the FVM path
      flutter_path = vim.fn.expand("~/fvm/versions/stable/bin/flutter"), -- Common FVM installation path
      -- flutter_lookup_cmd = "fvm flutter", -- Use fvm to look up flutter
      fvm = true,
      widget_guides = {
        enabled = true,
      },
    }
  end,
}
