local M = {}

M.config = {}

M.setup = function()
	local ok, neorg = pcall(require, "neorg")
	if not ok then
		return
	end

	neorg.setup({})
end
return M
