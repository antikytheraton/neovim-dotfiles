return {
	-- https://github.com/nvim-telescope/telescope-frecency.nvim
	"nvim-telescope/telescope-frecency.nvim",
	-- install the latest stable version
	version = "*",
	config = function(_, opts)
		require("telescope-frecency").setup({
			db_safe_mode = false,
			matcher = "fuzzy",
			scoring_function = function(recency, fzy_score)
				return -recency
			end,
		})
		require("telescope").load_extension("frecency")
	end,
}
