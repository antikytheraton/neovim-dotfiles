pcall(require, "impatient")

if require("first_load")() then
	return
end

vim.g.mapleader = ","

require("plugins")
require("keymaps")
require("settings")
