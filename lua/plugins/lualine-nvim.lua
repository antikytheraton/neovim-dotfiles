-- Status line
return {
  {
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup({
        -- spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        spinner = { "✶", "✸", "✹", "✺", "✹", "✷" },
        client_format = function(client_name, spinner, series_messages)
          return #series_messages > 0 and ("[" .. client_name .. "] " .. spinner) or nil
        end,
      })
    end,
  },
  {
    -- https://github.com/nvim-lualine/lualine.nvim
    "nvim-lualine/lualine.nvim",
    dependencies = {
      -- https://github.com/nvim-tree/nvim-web-devicons
      "nvim-tree/nvim-web-devicons", -- fancy icons
      -- https://github.com/linrongbin16/lsp-progress.nvim
      "linrongbin16/lsp-progress.nvim",
      "AndreM222/copilot-lualine", -- Copilot status
    },
    opts = {
      options = {
        -- For more themes, see https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
        theme = "auto", -- "auto, tokyonight, catppuccin, codedark, nord, ayu_dark"
      },
      sections = {
        lualine_a = { "mode" }, -- e.g., NORMAL, INSERT, VISUAL
        lualine_b = {
          {
            "branch",
            icon = "󰊢", -- Git branch icon (requires nvim-web-devicons)
          },
          {
            "diff",
            symbols = {
              added = " ", -- You can use any icon (e.g., Nerd Fonts)
              modified = " ",
              removed = " ",
            },
            colored = true, -- Disable to use global highlight
          },
          "diagnostics",    -- Git/LSP diagnostics (errors/warnings)
        },
        lualine_c = {
          {
            -- Customize the filename part of lualine to be parent/filename
            "filename",
            file_status = true,     -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 4,               -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            -- symbols = {
            --   modified = '[+]',      -- Text to show when the file is modified.
            --   readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
            -- }
          },
        },
        lualine_x = {
          -- LSP progress indicator (requires lsp-progress.nvim)
          function()
            return require("lsp-progress").progress()
          end,
          {
            -- Copilot status (requires copilot-lualine)
            "copilot",
            symbols = {
              status = {
                icons = {
                  enabled = " ",
                  sleep = " ", -- auto-trigger disabled
                  disabled = " ",
                  warning = " ",
                  unknown = " ",
                },
                hl = {
                  enabled = "#50FA7B",
                  sleep = "#AEB7D0",
                  disabled = "#6272A4",
                  warning = "#FFB86C",
                  unknown = "#FF5555",
                },
              },
              spinners = {
                "✶",
                "✸",
                "✹",
                "✺",
                "✹",
                "✷",
              },
              spinner_color = "#6272A4",
            },
            show_colors = false,
            show_loading = true,
          },
          "encoding",   -- File encoding (e.g., utf-8)
          "fileformat", -- File format (e.g., unix, windows)
          "filetype",   -- File type (e.g., lua, python)
          -- function()    -- Buffer type
          --   local buf = vim.api.nvim_get_current_buf()
          --   local name = vim.api.nvim_buf_get_name(buf)
          --   local ft = vim.bo[buf].filetype
          --   return string.format("[%s]", ft == "" and "no ft" or ft)
          -- end
        },
        lualine_y = { "progress" }, -- Progress through the file (e.g., 45%)
        lualine_z = { "location" }, -- Location in the file (e.g., line 10, column 20)
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location"},
        --   function() -- Buffer type
        --     local buf = vim.api.nvim_get_current_buf()
        --     local name = vim.api.nvim_buf_get_name(buf)
        --     local ft = vim.bo[buf].filetype
        --     return string.format("[%s]", ft == "" and "no ft" or ft)
        --   end
        -- },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    },
  },
}
