local present1, null_ls = pcall(require, "null-ls")

if not present1 then
    return
end

local M = {}

M.config = {
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.diagnostics.staticcheck,
    },
}

M.setup = function()
    null_ls.setup(M.config)
end

return M
