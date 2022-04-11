pcall(require, "impatient")

if require("first_load")() then
	return
end

vim.g.mapleader = ","
vim.opt.mouse = 'a'

require("plugins")
require("keymaps")
require("settings")
