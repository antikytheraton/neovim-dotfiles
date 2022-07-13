local M = {}

M.config = {
    -- Open request results in a horizontal split
    result_split_horizontal = false,
    -- Skip SSL verification, useful for unknown certificates
    skip_ssl_verification = false,
    -- Highlight request on run
    highlight = { enabled = true, timeout = 1000 },
    -- Jump to request line on run
    jump_to_request = false,
    result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
    },
    yank_dry_run = true,
}

M.setup = function()
    local status_ok, rest = pcall(require, "rest-nvim")
    if not status_ok then
        return
    end
    rest.setup(M.config)
end

return M
