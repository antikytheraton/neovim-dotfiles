local present1, lspconfig = pcall(require, "lspconfig")
local present2, cmp_lsp = pcall(require, "cmp_nvim_lsp")

if not (present1 and present2) then
    return
end

local function custom_on_attach(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gT", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    if client.server_capabilities.document_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.server_capabilities.document_range_formatting then
        buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    if client.server_capabilities.colorProvider then
        require("config.tailwind_colors.lsp-documentcolors").buf_attach(bufnr, { single_column = true })
    end
end

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()

custom_capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities.textDocument.completion.completionItem.preselectSupport = true
custom_capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
custom_capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
custom_capabilities.textDocument.completion.completionItem.deprecatedSupport = true
custom_capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
custom_capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = { 1 },
}
custom_capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

custom_capabilities = cmp_lsp.default_capabilities(custom_capabilities)

local custom_init = function(client)
    client.config.flags = client.config.flags or {}
    client.config.flags.allow_incremental_sync = true
end

local prettierd = require("config/efm/prettierd")
local eslint = require("config/efm/eslint")
local shellcheck = require("config/efm/shellcheck")
local shfmt = require("config/efm/shfmt")
local rustfmt = require("config/efm/rustfmt")

local servers = {
    bashls = true,
    cssls = true,
    -- clangd = true,
    dockerls = true,
    vimls = true,
    yamlls = true,
    sqlls = {
        settings = {
            root_dir = vim.loop.cwd,
        },
    },
    jsonls = true,
    efm = {
        root_dir = vim.loop.cwd,
        init_options = { documentFormatting = true, codeAction = true },
        settings = {
            rootMarkers = { ".git/" },
            log_level = 1,
            log_file = "~/efm.log",
            languages = {
                -- lua = { { formatCommand = "stylua -s --stdin-filepath ${INPUT} -", formatStdin = true } },
                typescript = { prettierd, eslint },
                javascript = { prettierd, eslint },
                typescriptreact = { prettierd, eslint },
                javascriptreact = { prettierd, eslint },
                yaml = { prettierd, eslint },
                -- json = { jq },
                html = { prettierd, eslint },
                scss = { prettierd, eslint },
                css = { prettierd, eslint },
                markdown = { prettierd, eslint },
                sh = { shellcheck, shfmt },
                sql = {
                    { formatCommand = "pg_format -u 1 -i", formatStdin = true },
                },
                fish = {
                    { formatCommand = "fish_indent" },
                },
                rust = { rustfmt },
            },
        },
        filetypes = {
            "css",
            "fish",
            "html",
            "javascript",
            "javascriptreact",
            -- "json",
            "lua",
            "markdown",
            "scss",
            "sh",
            "sql",
            "ts",
            "typescript",
            "typescriptreact",
            "yaml",
            "rust",
            -- "clangd",
        },
    },
    lua_ls = {
        cmd = { "lua-language-server" },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = { "lua/?.lua", "lua/?/init.lua" },
                },
                completion = { keywordSnippet = "Disable" },
                diagnostics = {
                    enable = true,
                    globals = {
                        "vim",
                        "describe",
                        "it",
                        "before_each",
                        "after_each",
                        "teardown",
                        "pending",
                        "use",
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        },
    },
    golangci_lint_ls = true,
    gopls = {
        cmd = { "gopls" },
        settings = {
            gopls = {
                experimentalPostfixCompletions = true,
                analyses = {
                    nilness = true,
                    shadow = false,
                    unusedwrites = true,
                    unusedparams = true,
                    unreachable = true,
                },
                codelenses = {
                    generate = true,
                    gc_details = true,
                    test = true,
                    tidy = true,
                },
                usePlaceholders = false,
                completeUnimported = true,
                staticcheck = true,
                matcher = "Fuzzy",
                diagnosticsDelay = "500ms",
                -- experimentalWatchedFileDelay = "100ms",
                symbolMatcher = "fuzzy",
                gofumpt = true,
            },
        },
    },
    pylsp = {
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = { 'W391' },
                        maxLineLength = 100,
                    }
                }
            }
        }
    },
    pyright = {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true
                }
            }
        }
    },
    ruff_lsp = {},
}

local setup_server = function(server, config)
    if not config then
        return
    end

    if type(config) ~= "table" then
        config = {}
    end

    config = vim.tbl_deep_extend("force", {
        on_init = custom_init,
        on_attach = custom_on_attach,
        capabilities = custom_capabilities,
        flags = { debounce_text_changes = 150 },
    }, config)

    lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
    setup_server(server, config)
end

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = "" },
    signs = true,
    underline = true,
    update_in_insert = false, -- update diagnostics insert mode
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

-- suppress error messages from lang servers
vim.notify = function(msg, log_level, _)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({ { msg } }, true, {})
    end
end
