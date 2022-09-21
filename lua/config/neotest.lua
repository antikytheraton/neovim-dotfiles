local M = {}

-- M.setup = function()
--     local status_ok, neotest = pcall(require, "neotest")
--     if not status_ok then
--         return
--     end
--     neotest.setup({
--         adapters = {
--             require("neotest-go")({
--                 experimental = {
--                     test_table = true,
--                 },
--                 args = { "-count=1", "-timeout=60s" }
--             })
--             -- require("neotest-python"),
--             -- require("neotest-jest"),
--         },
--     })
-- end

M.setup = function()
    local status_ok, neotest = pcall(require, "neotest")
    if not status_ok then
        return
    end
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
        virtual_text = {
            format = function(diagnostic)
                local message = diagnostic.message
                    :gsub("\n", " ")
                    :gsub("\t", " ")
                    :gsub("%s+", " ")
                    :gsub("^%s+", "")
                return message
            end,
        },
    }, neotest_ns)
    neotest.setup({
        adapters = {
            require("neotest-go")({
                experimental = {
                    test_table = true,
                },
                args = { "-race", "-count=1", "-timeout=60s" }
            })
        },
    })
end

return M
