return {
  "folke/trouble.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = "Trouble",
  modes = {
    test = {
      mode = "diagnostics",
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
    },
  },
}
