local M = {}

M.config = {
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
      python = ".venv/bin/python",
		}),
	},
}

M.setup = function()
	local ok, neotest = pcall(require, "neotest")
	if not ok then
		return
	end
	neotest.setup(M.config)
end

return M
