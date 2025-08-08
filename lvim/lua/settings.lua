------------------------------------------------------
-- Settings
------------------------------------------------------
lvim.leader = ","
lvim.transparent_window = true
-- lvim.colorscheme = "lunar"
-- lvim.colorscheme = "tokyonight-storm"
-- lvim.colorscheme = "catppuccin-mocha"
lvim.colorscheme = "neofusion"
-- vim.o.background = "dark"
-- lvim.builtin.lualine.options.theme = require("neofusion.lualine")

lvim.builtin.bufferline.active = false
-- Folding
vim.o.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- relative numbers
vim.wo.relativenumber = true

-- Open file at same location where it was opened last time
vim.cmd(
	[[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
)

-- Don't auto commenting new lines
vim.cmd([[ au BufEnter * set fo-=c fo-=r fo-=o ]])

-- Autom. read file when changed outside of Vim
vim.o.autoread = true
vim.cmd([[ au FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif ]])
vim.cmd([[ au FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None ]])

-- set filetype correctly for django template files
vim.cmd(
  [[ au BufNewFile,BufRead *.djhtml set filetype=htmldjango ]]
)

-- set filetype correctly for terraform tf files
vim.cmd(
  [[ au BufNewFile,BufRead *.tf set filetype=terraform ]]
)

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")
-- Enable wrap
vim.o.wrap = true
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append("<>hl")
-- Wrap long lines at a blank
vim.o.linebreak = true

-- Save undo history
vim.o.undofile = true
vim.o.undolevels = 1000
-- Number of command-lines that are remembered
vim.o.history = 10000
-- Use swapfiles
vim.o.swapfile = true
-- Autom. save file before some action
vim.o.autowrite = true
-- Keep backup file after overwriting a file
vim.o.backup = true
-- Make a backup before overwriting a file
vim.o.writebackup = false
-- Ignore case when completing file names and directories.
vim.o.wildignorecase = true

-- Set directories for backup/swap/undo files and create them if necessary
local Path = require("plenary.path")

local swapdir = Path:new(Path.path.home .. "/.cache/nvim/swap/")
if not swapdir:exists() then
	swapdir:mkdir()
end
vim.o.directory = tostring(swapdir)

local backupdir = Path:new(Path.path.home .. "/.cache/nvim/backup/")
if not backupdir:exists() then
	backupdir:mkdir()
end
vim.o.backupdir = tostring(backupdir)

local undodir = Path:new(Path.path.home .. "/.cache/nvim/undo/")
if not undodir:exists() then
	undodir:mkdir()
end
vim.o.undodir = tostring(undodir)


-- add `pyright` to `skipped_servers` list
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
	return server ~= "ruff_lsp"
end, lvim.lsp.automatic_configuration.skipped_servers)
