return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [s]tage hunk' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'git [r]eset hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
      map('n', '<leader>gu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
      map('n', '<leader>gP', gitsigns.preview_hunk_inline, { desc = 'git [P]review inline' })
      map('n', '<leader>gf', gitsigns.diffthis, { desc = 'git dif[f] against index' })
      map('n', '<leader>gF', function()
        gitsigns.diffthis '@'
      end, { desc = 'git Dif[f] against last commit' })
      -- Toggles
      map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
      -- keymap.set("n", "<leader>gl", ":Gitsigns blame_line<CR>")                                -- toggle git blame
      -- keymap.set("n", "<leader>gL", "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>") -- toggle git blame
    end,
  },
}
