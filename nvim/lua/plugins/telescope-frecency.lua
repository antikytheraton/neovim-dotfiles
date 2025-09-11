return {
  -- https://github.com/nvim-telescope/telescope-frecency.nvim
  "nvim-telescope/telescope-frecency.nvim",
  -- install the latest stable version
  version = "*",
  config = function(_, opts)
    require("telescope-frecency").setup({
      db_safe_mode = false
    })
    require("telescope").load_extension("frecency")
  end,
}
