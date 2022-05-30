pcall(require, "impatient")

if require("first_load")() then
    return
end

vim.g.mapleader = ","
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 1
vim.opt.mouse = "a"

require("plugins")
require("keymaps")
require("settings")
