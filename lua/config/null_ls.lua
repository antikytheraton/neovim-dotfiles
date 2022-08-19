local present1, null_ls = pcall(require, "null-ls")

if not present1 then
    return
end

local M = {}

M.config = {
    sources = {
        -- diagnostics
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.golangci_lint,
        -- null_ls.builtins.diagnostics.misspell,
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.diagnostics.staticcheck,
        -- null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.shellcheck,
        -- null_ls.builtins.diagnostics.luacheck,
        -- code_actions
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.code_actions.gitsigns,
        -- null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.code_actions.gitrebase,
        -- formatting
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports,
        -- null_ls.builtins.formatting.jq,
    },
}

M.setup = function()
    null_ls.setup(M.config)
end

return M
