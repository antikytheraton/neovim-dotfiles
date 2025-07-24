local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
vim.bo.softtabstop = 2

-- Line Wrapping
opt.wrap = true
opt.whichwrap:append("<>hl")
vim.o.linebreak = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Ignore case when completing file names and directories.
vim.o.wildignorecase = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split Windows
opt.splitright = true
opt.splitbelow = true

-- Consider - as part of keyword
opt.iskeyword:append("-")

-- Disable the mouse while in nvim
opt.mouse = "a"

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

--" Show LF as $ and CR as ^M
vim.opt.list = false
vim.opt.listchars = {
  eol = '$',
  tab = '>-',
  trail = '~',
  extends = '>',
  precedes = '<',
  nbsp = '+',
}

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
