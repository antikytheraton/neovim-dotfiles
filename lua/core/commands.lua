------------------------------------------------------
-- Commands
------------------------------------------------------

-- UNIX - DOS formatting commands
vim.cmd([[ command Dos2Unix !dos2unix %<cr> ]])
vim.cmd([[ command Unix2Dos !unix2dos %<cr> ]])
-- Format JSON using jq
vim.cmd([[ command JQ %!jq . <cr> ]])
-- Apply reorder-python-imports formatter
vim.cmd([[ command ReorderPythonImports !reorder-python-imports % <cr>]])
-- Session
vim.cmd([[ command SessionLoad lua require('persistence').load()<cr> ]])
-- Neotest
vim.cmd([[ command TestFile lua require("neotest").run.run(vim.fn.expand("%"))<cr> ]])
vim.cmd([[ command TestRun lua require("neotest").run.run()<cr> ]])
vim.cmd([[ command TestAttach lua require("neotest").run.attach()<cr> ]])
