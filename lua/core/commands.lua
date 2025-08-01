------------------------------------------------------
-- Commands
------------------------------------------------------

-- UNIX - DOS formatting commands
vim.cmd([[ command Dos2Unix !dos2unix %<cr> ]])
vim.cmd([[ command Unix2Dos !unix2dos %<cr> ]])
-- Format JSON using jq
vim.cmd([[ command JQ %!jq . <cr> ]])
-- Apply reorder-python-imports formatter
vim.cmd([[ command ReorderPythonImports silent! !reorder-python-imports % <cr>]])
-- Session
vim.cmd([[ command SessionLoad lua require('persistence').load()<cr> ]])
-- Neotest
vim.cmd([[ command TestFile lua require("neotest").run.run(vim.fn.expand("%"))<cr> ]])
vim.cmd([[ command TestRun lua require("neotest").run.run()<cr> ]])
vim.cmd([[ command TestAttach lua require("neotest").run.attach()<cr> ]])
-- Force pyright LSP enabled (for Python files)
vim.cmd([[ command EnablePythonLSP lua vim.lsp.enable('basedpyright')<cr> ]])

-- Make current file executable
vim.api.nvim_create_user_command('MakeExecutable',
  function()
    local file = vim.fn.expand('%:p')
    if file ~= '' then
      vim.fn.system('chmod u+x ' .. vim.fn.shellescape(file))
      print('Made executable: ' .. file)
    else
      print('No file name')
    end
  end,
  { desc = 'Make the current file executable' }
)

vim.api.nvim_create_user_command("IPDB", function()
  local line = "__import__('ipdb').set_trace(context=20)  # HACK: add breakpoint for debugging"
  vim.api.nvim_put({ line }, "l", true, true)
end, {
  desc = "Insert Python IPDB breakpoint",
})

vim.api.nvim_create_user_command("TT", function()
  local line = "import typing as t"
  vim.api.nvim_put({ line }, "l", true, true)
end, {
  desc = "Add type hints to the current line",
})
