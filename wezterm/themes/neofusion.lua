local M = {}

M.colors = {
	foreground = "#e0d9c7",
	background = "#070f1c",
	cursor_bg = "#e0d9c7",
	cursor_border = "#e0d9c7",
	cursor_fg = "#070f1c",
	selection_bg = "#ea6847",
	selection_fg = "#e0d9c7",
	ansi = {
		"#070f1c", -- Black (Host)
		"#fd5e3a", -- Red (Syntax string)
		"#fd5e3a", -- Green (Command)
		"#5db2f8", -- Yellow (Command second)
		"#2f516c", -- Blue (Path)
		"#fa7a61", -- Magenta (Syntax var)
		"#86dbf5", -- Cyan (Prompt)
		"#e0d9c7", -- White
	},
	brights = {
		"#2f516c", -- Bright Black
		"#fd5e3a", -- Bright Red (Command error)
		"#ea6847", -- Bright Green (Exec)
		"#86dbf5", -- Bright Yellow
		"#5db2f8", -- Bright Blue (Folder)
		"#fd5e3a", -- Bright Magenta
		"#ea6847", -- Bright Cyan
		"#e0d9c7", -- Bright White
	},
}

return M
