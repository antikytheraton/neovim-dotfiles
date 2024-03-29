local M = {}

M.setup = function()
    local present1, cmp = pcall(require, "cmp")
    local present2, lspkind = pcall(require, "lspkind")
    local present3, luasnip = pcall(require, "luasnip")

    if not (present1 and present2 and present3) then
        return
    end

    cmp.setup({
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<Up>"] = cmp.mapping.select_prev_item(),
            ["<Down>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-y>"] = cmp.config.disable,
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        sources = cmp.config.sources({
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            {
                name = "tmux",
                max_item_count = 5,
                option = { all_panes = true },
                keyword_length = 5,
            },
            {
                name = "look",
                keyword_length = 5,
                max_item_count = 5,
                option = { convert_case = true, loud = true },
            },
            { name = "calc" },
            { name = "fish" },
            { name = "emoji" },
            {
                name = "buffer",
                option = {
                    keyword_pattern = [[\k\+]], -- for recognizing isKeyword
                    -- list options from all buffers
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                    -- list options only from visible buffers
                    -- get_bufnrs = function()
                    --     local bufs = {}
                    --     for _, win in ipairs(vim.api.nvim_list_wins()) do
                    --         bufs[vim.api.nvim_win_get_buf(win)] = true
                    --     end
                    --     return vim.tbl_keys(bufs)
                    -- end,
                },
            },
        }, {}),

        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        formatting = {
            format = lspkind.cmp_format({
                mode = "symbol_text",
                maxwidth = 50,
                menu = {
                    buffer = "[buf]",
                    calc = "[calc]",
                    emoji = "[emoji]",
                    fish = "[fish]",
                    look = "[look]",
                    luasnip = "[snip]",
                    nvim_lsp = "[lsp]",
                    nvim_lua = "[lua]",
                    path = "[path]",
                    tmux = "[tmux]",
                },
            }),
        },

        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,

                function(entry1, entry2)
                    local _, entry1_under = entry1.completion_item.label:find("^_+")
                    local _, entry2_under = entry2.completion_item.label:find("^_+")
                    entry1_under = entry1_under or 0
                    entry2_under = entry2_under or 0
                    if entry1_under > entry2_under then
                        return false
                    elseif entry1_under < entry2_under then
                        return true
                    end
                end,

                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },

        experimental = { native_menu = false, ghost_text = true },
    })
    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline("/", {
        sources = cmp.config.sources({ { name = "buffer", keyword_length = 3 } }),
    })
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
            { name = "path" },
            { name = "cmdline" },
        }),
    })
    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            { name = "emoji" },
        }, {
            { name = "buffer" },
        }),
    })
end

return M
