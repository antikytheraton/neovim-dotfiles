return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    dir = vim.fn.expand(vim.fn.stdpath("config") .. "/.session/"),
  }
}
