return {
  "folke/trouble.nvim",
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  cmd = "Trouble",
  keys = {
    -- LSP navigation
    { "gd",         "<cmd>Trouble lsp_definitions<CR>",                           desc = "Definition" },
    { "gD",         "<cmd>Trouble lsp_declarations<CR>",                          desc = "Declaration" },
    { "gi",         "<cmd>Trouble lsp_implementations<CR>",                       desc = "Implementation" },
    { "gt",         "<cmd>Trouble lsp_type_definitions<CR>",                      desc = "Type definition" },
    { "gr",         "<cmd>Trouble lsp_references<CR>",                            desc = "References" },
    -- Trouble panels
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",                        desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",           desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>",                desc = "Symbols (Trouble)" },
    { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP Def / ref / ... (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<CR>",                            desc = "Location List (Trouble)" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>",                             desc = "Quickfix List (Trouble)" },
  },
  modes = {
    test = {
      mode = "diagnostics",
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
    },
  },
}
