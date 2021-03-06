local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Fix some common typos
map("c", "Q", "q", opts)

-- Normal

-- Hijacked Netrw
-- map("n", "<c-b>", "<cmd>NvimTreeRefresh<cr><cmd>NvimTreeToggle<cr>", opts)
-- map("n", "<c-b>", "<cmd>NnnExplorer<cr>", opts)
-- vim.api.nvim_buf_set_keymap(0, "t", "<c-b>", "<cmd>NnnExplorer<cr>", opts)

-- floatterm
vim.g.floaterm_keymap_new = "<c-n>"
vim.g.floaterm_keymap_hide = "<c-n>"
vim.g.floaterm_keymap_toggle = "<c-n>"
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.floaterm_autoclose = 2
-- vim.g.border_chars = "─│─│┌┐┘└"
vim.g.border_chars = "─│─│╭╮╯╰"
-- float | split | vsplit
vim.g.floaterm_wintype = "float"

-- toggleterm
function _G.set_terminal_keymaps()
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

-- toggle theme
map("n", "<leader>mm", "<cmd>lua require'material.functions'.toggle_style()<cr>", opts)

-- Move to previous/next
map("n", "<A-Left>", ":BufferPrevious<cr>", opts)
map("n", "<A-Right>", ":BufferNext<cr>", opts)

-- Re-order to previous/next
map("n", "<A-,>", ":BufferMovePrevious<cr>", opts)
map("n", "<A-.>", " :BufferMoveNext<cr>", opts)

-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<cr>", opts)
map("n", "<A-2>", ":BufferGoto 2<cr>", opts)
map("n", "<A-3>", ":BufferGoto 3<cr>", opts)
map("n", "<A-4>", ":BufferGoto 4<cr>", opts)
map("n", "<A-5>", ":BufferGoto 5<cr>", opts)
map("n", "<A-6>", ":BufferGoto 6<cr>", opts)
map("n", "<A-7>", ":BufferGoto 7<cr>", opts)
map("n", "<A-8>", ":BufferGoto 8<cr>", opts)
map("n", "<A-9>", ":BufferGoto 9<cr>", opts)
map("n", "<A-0>", ":BufferLast<cr>", opts)

-- Close buffer
map("n", "<A-c>", ":BufferClose<cr>", opts)

-- Close windows
map("n", "Q", ":close<cr>", opts)

-- Telescope select files
map("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<cr>", opts)
map("n", "<C-Down>", ":resize -2<cr>", opts)
map("n", "<C-Left>", ":vertical resize +2<cr>", opts)
map("n", "<C-Right>", ":vertical resize -2<cr>", opts)

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-j>", ":m .+1<cr>==", opts)

-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-k>", ":m .-2<cr>==", opts)

-- Enhanced increment/decrement
--map("n", "<C-a>", require("dial.map").inc_normal(), opts)
--map("n", "<C-x>", require("dial.map").dec_normal(), opts)

-- Stay centered jumping between search results
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Fix cursor position after joining lines
map("n", "J", "mzJ`z", opts)

-- clear any highlights when <esc> is pressed
map("n", "<Esc>", ":noh<CR>", opts)

-- move one up/down display line instead of physicial line
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Insert mode

-- 'jk' for quitting insert mode
map("i", "jk", "<ESC>", opts)

-- 'kj' for quitting insert mode
map("i", "kj", "<ESC>", opts)

-- 'jj' for quitting insert mode
map("i", "jj", "<ESC>", opts)

-- Visual mode

-- Search for visually selected text
map("v", "//", 'y/<C-R>"<cr>', opts)

-- Have the same buffer on clipboard for multiple pastes
map("v", "p", "pgvy", opts)

-- Visual block mode

-- Move current line / block with Alt-j/k ala vscode.
map("x", "<A-j>", ":m '>+1<cr>gv-gv", opts)
map("x", "<A-k>", ":m '<-2<cr>gv-gv", opts)

-- Use tab for indenting in visual mode
map("x", "<Tab>", ">gv|", opts)
map("x", "<S-Tab>", "<gv", opts)

-- Copy to system clipboard
map("x", "\\y", '"+y', opts)
map("x", "<C-c>", '"+y', opts)

-- Cut to system clipboard
map("x", "\\d", '"+d', opts)
map("x", "<C-x>", '"+d', opts)

---- Hop keybindings
--map(
--	"n",
--	"f",
--	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
--	{}
--)
--map(
--	"n",
--	"F",
--	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
--	{}
--)
--map(
--	"o",
--	"f",
--	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
--	{}
--)
--map(
--	"o",
--	"F",
--	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
--	{}
--)
--map("", "t", "<cmd>lua require'hop'.hint_words()<cr>", {})
--map("", "T", "<cmd>lua require'hop'.hint_lines()<cr>", {})

-- DAP
--map("n", "<F5>", "<cmd>require'dap'.continue<cr>", opts)
--map("n", "<F10>", "<cmd>require'dap'.step_over<cr>", opts)
--map("n", "<F11>", "<cmd>require'dap'.step_into<cr>", opts)
--map("n", "<F12>", "<cmd>require'dap'.step_out<cr>", opts)

-- Make the dot command work as expected in visual mode
-- https://www.reddit.com/r/vim/comments/3y2mgt/
map("v", ".", ":norm .<cr>", opts)

-- quickfix mappings
map("n", "[q", ":cprevious<CR>", opts)
map("n", "]q", ":cnext<CR>", opts)
map("n", "]Q", ":clast<CR>", opts)
map("n", "[Q", ":cfirst<CR>", opts)
