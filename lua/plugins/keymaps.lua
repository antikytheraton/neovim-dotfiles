return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.mapleader = ","
  end,
  opts = {
    spec = {
      { "<leader>w", group = "Window" },
      { "<leader>t", group = "Tab" },
      { "<leader>q", group = "Quickfix" },
      { "<leader>c", group = "Diff" },
      { "<leader>d", group = "Debug" },
      { "<leader>b", group = "Breakpoints" },
      { "<leader>h", group = "Harpoon" },
      { "<leader>s", group = "Search" },
      { "<leader>g", group = "Git" },
      { "<leader>e", group = "Explorer" },
      { "<leader>r", group = "REST" },
      { "<leader>x", group = "Diagnostics" },
    },
  },
  keys = {
    -- Help
    { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer local keymaps" },

    -- General
    { "<leader>/", "<cmd>Commentary<CR>", desc = "Comment", mode = { "n", "v" } },
    { "<leader>qq", "<cmd>q!<CR>", desc = "Quit without saving" },
    { "<leader>w", "<cmd>w<CR>", desc = "Save" },
    { "<leader>tl", function() vim.opt.list = not vim.opt.list:get() end, desc = "Toggle visible whitespace" },

    -- Window management
    { "<leader><bar>", "<C-w>v", desc = "Split vertically" },
    { "<leader>-", "<C-w>s", desc = "Split horizontally" },
    { "<leader>we", "<C-w>=", desc = "Equalize windows" },
    { "<leader>wx", "<cmd>close<CR>", desc = "Close window" },
    { "<leader>wj", "<C-w>-", desc = "Decrease height" },
    { "<leader>wk", "<C-w>+", desc = "Increase height" },
    { "<leader>wl", "<C-w>>5", desc = "Increase width" },
    { "<leader>wh", "<C-w><5", desc = "Decrease width" },

    -- Tab management
    { "<leader>to", "<cmd>tabnew<CR>", desc = "New tab" },
    { "<leader>tx", "<cmd>tabclose<CR>", desc = "Close tab" },
    { "<leader>tn", "<cmd>tabn<CR>", desc = "Next tab" },
    { "<leader>tp", "<cmd>tabp<CR>", desc = "Previous tab" },

    -- Diff
    { "<leader>cc", "<cmd>diffput<CR>", desc = "Put diff" },
    { "<leader>cj", "<cmd>diffget 1<CR>", desc = "Get from left" },
    { "<leader>ck", "<cmd>diffget 3<CR>", desc = "Get from right" },
    { "<leader>cn", "]c", desc = "Next hunk" },
    { "<leader>cp", "[c", desc = "Previous hunk" },

    -- Quickfix
    { "<leader>qo", "<cmd>copen<CR>", desc = "Open quickfix" },
    { "<leader>qf", "<cmd>cfirst<CR>", desc = "First item" },
    { "<leader>qn", "<cmd>cnext<CR>", desc = "Next item" },
    { "<leader>qp", "<cmd>cprev<CR>", desc = "Previous item" },
    { "<leader>ql", "<cmd>clast<CR>", desc = "Last item" },
    { "<leader>qc", "<cmd>cclose<CR>", desc = "Close quickfix" },

    -- Maximizer
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Toggle maximize" },

    -- Nvim-tree
    { "<leader>ee", "<cmd>NvimTreeFindFile<CR>", desc = "Find file in tree" },

    -- Telescope / Search
    { "<leader>ff", "<cmd>Telescope frecency workspace=CWD path_display={'smart'}<CR>", desc = "Frecency find" },
    { "<leader>st", require("telescope.builtin").live_grep, desc = "Live grep" },
    { "<leader>sw", require("telescope.builtin").grep_string, desc = "Grep string" },
    { "<leader>sl", require("telescope.builtin").resume, desc = "Resume picker" },
    { "<leader>sg", require("telescope.builtin").git_files, desc = "Git files" },
    { "<leader>sb", require("telescope.builtin").buffers, desc = "Buffers" },
    { "<leader>sh", require("telescope.builtin").help_tags, desc = "Help tags" },
    { "<leader>ss", require("telescope.builtin").current_buffer_fuzzy_find, desc = "Buffer fuzzy find" },
    { "<leader>so", "<cmd>Telescope oldfiles<CR>", desc = "Old files" },
    { "<leader>sc", "<cmd>Telescope neoclip<CR>", desc = "Clipboard" },
    { "<leader>si", require("telescope.builtin").lsp_incoming_calls, desc = "LSP incoming calls" },
    { "<leader>sM", function() require("telescope.builtin").treesitter({ default_text = ":method:" }) end, desc = "Methods" },
    { "<leader>sF", function() require("telescope.builtin").treesitter({ symbols = { "function", "method" } }) end, desc = "Functions" },

    -- Git
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    { "<leader>gb", "<cmd>GitBlameToggle<CR>", desc = "Toggle blame" },
    { "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Git status" },

    -- Harpoon
    { "<leader>ha", require("harpoon.mark").add_file, desc = "Add file" },
    { "<leader>hh", require("harpoon.ui").toggle_quick_menu, desc = "Quick menu" },
    { "<leader>h1", function() require("harpoon.ui").nav_file(1) end, desc = "File 1" },
    { "<leader>h2", function() require("harpoon.ui").nav_file(2) end, desc = "File 2" },
    { "<leader>h3", function() require("harpoon.ui").nav_file(3) end, desc = "File 3" },
    { "<leader>h4", function() require("harpoon.ui").nav_file(4) end, desc = "File 4" },
    { "<leader>h5", function() require("harpoon.ui").nav_file(5) end, desc = "File 5" },
    { "<leader>h6", function() require("harpoon.ui").nav_file(6) end, desc = "File 6" },
    { "<leader>h7", function() require("harpoon.ui").nav_file(7) end, desc = "File 7" },
    { "<leader>h8", function() require("harpoon.ui").nav_file(8) end, desc = "File 8" },
    { "<leader>h9", function() require("harpoon.ui").nav_file(9) end, desc = "File 9" },

    -- REST
    { "<leader>rr", "<cmd>call VrcQuery()<CR>", desc = "Run query" },

    -- Diagnostics
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>xs", "<cms>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "Lsp Def / ref / ... (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location List (Trouble)" },
    { "<leader>xx", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List (Trouble)" },

    -- LSP leader keymaps
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>", desc = "Format", mode = { "n", "v" } },
    { "<leader>ts", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", desc = "Document symbols" },

    -- Debug
    { "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
    { "<leader>bc", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", desc = "Conditional breakpoint" },
    { "<leader>bl", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", desc = "Log point" },
    { "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<CR>", desc = "Clear breakpoints" },
    { "<leader>ba", "<cmd>Telescope dap list_breakpoints<CR>", desc = "List breakpoints" },
    { "<leader>dd", function() require("dap").disconnect(); require("dapui").close() end, desc = "Disconnect" },
    { "<leader>dt", function() require("dap").terminate(); require("dapui").close() end, desc = "Terminate" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", desc = "Toggle REPL" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", desc = "Run last" },
    { "<leader>di", function() require("dap.ui.widgets").hover() end, desc = "Widget hover" },
    { "<leader>d?", function()
      local widgets = require("dap.ui.widgets")
      widgets.centered_float(widgets.scopes)
    end, desc = "Widget scopes" },
    { "<leader>df", "<cmd>Telescope dap frames<CR>", desc = "Frames" },
    { "<leader>dh", "<cmd>Telescope dap commands<CR>", desc = "Commands" },
    { "<leader>de", function() require("telescope.builtin").diagnostics({ default_text = ":E:" }) end, desc = "Error diagnostics" },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    local km = vim.keymap.set

    km("n", "gx", ":!open <c-r><c-a><CR>", { desc = "Open URL under cursor" })
    km("x", "<Tab>", ">gv|", { desc = "Indent in visual mode" })
    km("x", "<S-Tab>", "<gv", { desc = "Dedent in visual mode" })
    km("n", "<Esc>", ":noh<CR>", { desc = "Clear highlights" })
    km("n", "j", "gj", { desc = "Move down display line" })
    km("n", "k", "gk", { desc = "Move up display line" })
    km("v", "p", "pgvy", { desc = "Preserve clipboard" })
    km("n", "n", "nzzzv", { desc = "Next search centered" })
    km("n", "N", "Nzzzv", { desc = "Prev search centered" })
    km("c", "Q", "q", { desc = "Fix typo Q" })
    km("c", "W", "w", { desc = "Fix typo W" })
    km("n", "<C-p>", require("telescope.builtin").find_files, { desc = "Find files" })

    -- LSP
    km("n", "gd", "<cmd>Trouble lsp_definitions<CR>", { desc = "Definition" })
    km("n", "gD", "<cmd>Trouble lsp_declarations<CR>", { desc = "Declaration" })
    km("n", "gi", "<cmd>Trouble lsp_implementations<CR>", { desc = "Implementation" })
    km("n", "gt", "<cmd>Trouble lsp_type_definitions<CR>", { desc = "Type definition" })
    km("n", "gr", "<cmd>Trouble lsp_references<CR>", { desc = "References" })
    km("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })
    km("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
    km("n", "[q", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev diagnostic" })
    km("n", "]q", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
    km("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>", { desc = "LSP completion" })

    -- Debug
    km("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Continue" })
    km("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" })
    km("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" })
    km("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" })

    -- Spider
    km({ "n", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
    km({ "n", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
    km({ "n", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
    km({ "n", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
  end,
}
