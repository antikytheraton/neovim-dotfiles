return {
  -- https://github.com/nvim-telescope/telescope-frecency.nvim
  "nvim-telescope/telescope-frecency.nvim",
  -- install the latest stable version
  version = "*",
  config = function()
    require("telescope").load_extension("frecency")
  end,
}
