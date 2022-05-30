return {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
    env = {
        string.format("PRETTIERD_DEFAULT_CONFIG=%s", vim.fn.expand("~/.config/nvim/lua/config/efm/.prettierrc.json")),
    },
}
