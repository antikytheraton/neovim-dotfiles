local gitsigns = require('gitsigns')

-- Refresh GitSigns on certain events
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'VimLeavePre' }, {
  pattern = '*',
  callback = function()
    -- Only refresh if in a Git repo
    if vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null') == 'true\n' then
      vim.schedule(function()
        gitsigns.refresh()
      end)
    end
  end,
})

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]], false)

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

