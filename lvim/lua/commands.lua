------------------------------------------------------
-- Commands
------------------------------------------------------

-- delete trailing spaces
vim.cmd([[ command DeleteTrailingSpaces %s/\\s\\+$//e<cr> ]])
-- UNIX - DOS formatting commands
vim.cmd([[ command Dos2Unix !dos2unix %<cr> ]])
vim.cmd([[ command Unix2Dos !unix2dos %<cr> ]])
-- Format JSON using jq
vim.cmd([[ command JQ %!jq . <cr> ]])
-- Apply reorder-python-imports formatter
vim.cmd([[ command ReorderPythonImports !reorder-python-imports % <cr>]])
-- Run Make Test
vim.cmd([[ command PyTest AsyncRun -mode=term -pos=tmux -rows=10 env_export local-overrides.env && .venv/bin/pytest<cr> ]])
-- Session
vim.cmd([[ command SessionLoad lua require('persistence').load()<cr> ]])
-- VENN
vim.cmd([[ command ToggleVENN lua require('config.venn').toggle()<cr> ]])

vim.cmd([[ command TestFile lua require("neotest").run.run(vim.fn.expand("%"))<cr> ]])
vim.cmd([[ command TestRun lua require("neotest").run.run()<cr> ]])
vim.cmd([[ command TestAttach lua require("neotest").run.attach()<cr> ]])
