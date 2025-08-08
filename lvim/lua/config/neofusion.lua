local M = {}

M.config = {}

M.lualine_colors = function()
	local palette = {
		dark0 = "#06101e",
		dark1 = "#031B26",
		dark2 = "#052839",
		dark3 = "#06364B",
		dark4 = "#08435E",
		light0 = "#66def9",
		light1 = "#66def9",
		light2 = "#008DA3",
		light3 = "#006A7A",
		light4 = "#004752",
		bright_red = "#fd5e3a",
		bright_green = "#35b5ff",
		bright_yellow = "#fd5e3a",
		bright_blue = "#e2d9c5",
		bright_purple = "#fa7a61",
		bright_aqua = "#e2d9c5",
		bright_orange = "#fd5e3a",
		neutral_red = "#fd5e3a",
		neutral_green = "#35b5ff",
		neutral_yellow = "#fd5e3a",
		neutral_blue = "#22536f",
		neutral_purple = "#ec30ac",
		neutral_aqua = "#66def9",
		neutral_orange = "#35b5ff",
		faded_red = "#fd5e3a",
		faded_green = "#5f6e29",
		faded_yellow = "#fa7a61",
		faded_blue = "#004752",
		faded_purple = "#ec30ac",
		faded_aqua = "#5f6e29",
		faded_orange = "#fa7a61",
		dark_red = "#722529",
		light_red = "#fc9487",
		dark_green = "#5f6e29",
		light_green = "#98971a",
		dark_aqua = "#06364B",
		light_aqua = "#e8e5b5",
		gray = "#22536f",
	}

	return {
		normal = {
			a = { bg = palette.light0, fg = palette.dark0, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.bright_aqua },
			c = { bg = palette.dark1, fg = palette.bright_aqua },
		},
		insert = {
			a = { bg = palette.dark3, fg = palette.bright_aqua, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.bright_aqua },
			c = { bg = palette.dark1, fg = palette.light0 },
		},
		visual = {
			a = { bg = palette.bright_red, fg = palette.dark0, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.bright_aqua },
			c = { bg = palette.dark1, fg = palette.bright_aqua },
		},
		replace = {
			a = { bg = palette.neutral_green, fg = palette.dark0, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.bright_aqua },
			c = { bg = palette.dark1, fg = palette.bright_aqua },
		},
		command = {
			a = { bg = palette.bright_red, fg = palette.dark0, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.neutral_orange },
			c = { bg = palette.dark1, fg = palette.neutral_orange },
		},
		inactive = {
			a = { bg = palette.dark2, fg = palette.light3, gui = "bold" },
			b = { bg = palette.dark1, fg = palette.light3 },
			c = { bg = palette.dark1, fg = palette.light3 },
		},
	}
end

M.setup = function()
	local ok, neofusion = pcall(require, "neofusion")
	if not ok then
		return
	end

	neofusion.setup(M.config)
	if lvim.colorscheme == "neofusion" then
		lvim.builtin.lualine.options.theme = M.lualine_colors()
	end
end

return M
