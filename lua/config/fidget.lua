local M = {}

M.setup = function()
	local status_ok, fidget = pcall(require, "fidget")
	if not status_ok then
		return
	end

	fidget.setup({
		text = {
			spinner = "dots", -- animation shown when tasks are ongoing
			done = "✔", -- character shown when all tasks are complete
			commenced = "Started", -- message shown when task starts
			completed = "Completed", -- message shown when task completes
		},
	})
end

return M
