local M = {}

M.config = {
    statuslines = {}
}

M.setup = function()
    local status_ok, windline = pcall(require, "windline")
    if not status_ok then
        return
    end
    windline.setup(M.config)
end

return M
