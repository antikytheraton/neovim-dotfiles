local M = {}

M.setup = function()
    local trailspace_ok, trailspace = pcall(require, "mini.trailspace")
    if not trailspace_ok then
        return
    end
    trailspace.setup({
        -- Highlight only in normal buffers (ones with empty 'buftype'). This is
        -- useful to not show trailing whitespace where it usually doesn't matter.
        only_in_normal_buffers = true,
    })
end

return M
