local M = {}

local present1, gps = pcall(require, "nvim-gps")
if not present1 then
    return
end

M.config = {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        icons_enabled = true,
        theme = 'auto',
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
            { "filename", path = 1 },
            { "diagnostics", sources = { "nvim_diagnostic" } },
            "diff",
            { gps.get_location, cond = gps.is_available },
        },
        lualine_x = { "filetype", "encoding" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "quickfix", "toggleterm" },
}

M.setup = function()
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
        return
    end
    lualine.setup(M.config)
end

return M
