local null_ls = require("null-ls")

null_ls.setup{
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.completion.spell,
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
