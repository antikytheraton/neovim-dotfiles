------------------------------------------------------
-- Keymaps
------------------------------------------------------
lvim.builtin.terminal.open_mapping = [[<c-n>]]
-- lvim.builtin.terminal.open_mapping = [[<c-^D>]]

local mappings = lvim.builtin.which_key.mappings

-- lvim.builtin.nvimtree.active = false -- NOTE: using neo-tree
-- mappings["e"] = { "<cmd>NeoTreeFocusToggle<cr>", "NeoTree Explorer" }
-- mappings["e"] = { "<cmd>NnnPicker %:p:h<cr>", "NNN Explorer" }

mappings["|"] = { "<cmd>vsp<cr>", "Window vertical split" }
mappings["-"] = { "<cmd>sp<cr>", "Window horizontal split" }
mappings["c"] = { "<cmd>Telescope neoclip star<CR>", "Clipboard manager" }
mappings["k"] = { "<cmd>BufferKill<CR>", "Close Buffer" }

-- Telescope
mappings["s"]["e"] =
	{ "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji', 'kaomoji', 'gitmoji'} }<cr>", "Emoji" }
mappings["s"]["M"] = { "<cmd>Telescope marks<CR>", "Bookmarks" }
mappings["s"]["o"] = { "<cmd>Telescope oldfiles<CR>", "Old files" }
mappings["s"]["T"] = { "<cmd>TodoTelescope<CR>", "Find TODO" }
mappings["s"]["w"] = { "<cmd>Telescope grep_string<CR>", "Word under cursor" }
mappings["s"]["n"] = { "<cmd>NoiceTelescope<CR>", "Show notifications history" }
mappings["s"]["b"] = {
	"<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>",
	"Search buffers (ignoring current buffer)",
}

-- custom LSP format
mappings["l"]["f"] = { "<cmd>lua require('lvim.lsp.utils').format({timeout_ms=2000})<cr>", "Format" }

-- Sessions
mappings["S"] = {
	name = "Session",
	c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
	l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
	Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Gitsigns
mappings["gS"] = { '<cmd>lua require"gitsigns".stage_buffer()<cr>', "Stage Buffer" }

-- Misc utils
mappings["m"] = {
	name = "Misc",
	["t"] = { "<cmd>%s/\\s\\+$//e<cr>", "Delete trailing spaces" },
	["d"] = { "<cmd>!dos2unix %<cr>", "Dos 2 Unix" },
	["u"] = { "<cmd>!unix2dos %<cr>", "Unix 2 Dos" },
	["j"] = { "<cmd>%!jq '.'<cr>", "Format JSON using JQ" },
	["p"] = { "<cmd>!reorder-python-imports %<cr>", "Reorder python imports" },
}
-- Trouble
mappings["x"] = {
	name = "Trouble",
	x = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble" },
	X = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
	s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
	q = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
	l = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)" },
	r = {
		"<cmd>Trouble symbols toggle pinned=true results.win.relative=win results.win.position=right<cr>",
		"LSP Definitions / references / ... (Trouble)",
	},
}
vim.keymap.set("n", "gR", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
-- Neotest
mappings["t"] = {
	name = "Neotest",
	t = { "<cmd>lua require('neotest').run.run()<cr>", "Run test" },
	f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run file tests" },
	a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach test" },
	o = { "<cmd>Neotest output-panel<cr>", "Test output panel" },
	s = { "<cmd>Neotest summary<cr>", "Test Summary" },
}

-- toggle keymappings for venn using <leader>v
-- venn.nvim: enable or disable keymappings
mappings["v"] = {
	name = "Venn",
	["v"] = { "lua require('config.venn').toggle()", "Toggle VENN ASCII Diagrams" },
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope select files
-- map("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
map("n", "<C-p>", "<cmd>Telescope frecency workspace=CWD path_display={'shorten'}<cr>", opts)
-- clear any highlights when <esc> is pressed
map("n", "<Esc>", ":noh<CR>", opts)
-- move one up/down display line instead of physicial line
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)
-- Search for visually selected text
map("v", "//", 'y/<C-R>"<cr>', opts)
-- Use tab for indenting in visual mode
map("x", "<Tab>", ">gv|", opts)
map("x", "<S-Tab>", "<gv", opts)
-- quickfix mappings
map("n", "]q", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
map("n", "[q", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
map("n", "]Q", ":clast<CR>", opts)
map("n", "[Q", ":cfirst<CR>", opts)
-- git mappings
map("n", "]c", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", opts)
map("n", "[c", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", opts)
-- Stay centered jumping between search results
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
-- Fix cursor position after joining lines
map("n", "J", "mzJ`z", opts)
-- Have the same buffer on clipboard for multiple pastes
map("v", "p", "pgvy", opts)
-- Make the dot command work as expected in visual mode
-- https://www.reddit.com/r/vim/comments/3y2mgt/
map("v", ".", ":norm .<cr>", opts)
-- DAP
map("n", "<F5>", "<cmd>require'dap'.continue<cr>", opts)
map("n", "<F6>", "<cmd>require'dap'.step_over<cr>", opts)
map("n", "<F7>", "<cmd>require'dap'.step_into<cr>", opts)
map("n", "<F8>", "<cmd>require'dap'.step_out<cr>", opts)
map("n", "mm", "<cmd>MinimapToggle<cr>", opts)
-- Fix some common typos
map("c", "Q", "q", opts)
map("c", "W", "w", opts)
-- Use Escape on terminal to switch from insert to normal mode
-- map("t", "<Esc>", "<C-\\><C-n>", opts)
-- format visual selection
vim.keymap.set("v", "f", vim.lsp.buf.format)
-- vim.keymap.set("v", "f", vim.lsp.buf.range_formatting())
-- Spider keymaps overrides
vim.keymap.set({ "n", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

-- NOTE: Disabling custom Leap settings (defaults)
-- vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
-- vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
-- vim.keymap.set({'n', 'x', 'o'}, 't', '<Plug>(leap-forward-till)')
-- vim.keymap.set({'n', 'x', 'o'}, 'T', '<Plug>(leap-backward-till)')

vim.keymap.set({ "n", "x", "o" }, "s", function()
	local focusable_windows = vim.tbl_filter(function(win)
		return vim.api.nvim_win_get_config(win).focusable
	end, vim.api.nvim_tabpage_list_wins(0))

	require("leap").leap({
		-- target_windows = require("leap.util").get_enterable_windows(),
		target_windows = focusable_windows,
	})
end)
