-- no need to set style = "lvim"
local components = require("lvim.core.lualine.components")

-- lvim.builtin.lualine.sections.lualine_a = { "mode", "branch" }
lvim.builtin.lualine.sections.lualine_y = {
	components.encoding,
	components.location,
}

lvim.builtin.lualine.sections.lualine_x = {
	{
		require("noice").api.statusline.mode.get,
		cond = require("noice").api.statusline.mode.has,
		color = { fg = "#ff9e64" },
	},
	"copilot",
}
