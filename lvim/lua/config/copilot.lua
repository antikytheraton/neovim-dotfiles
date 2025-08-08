local M = {}

M.config_copilot = {}

M.config_copilot_cmp = {
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		lua = true,
		python = true,
		go = true,
		javascript = true,
		typescript = true,
		markdown = true,
		terraform = false,
		sh = function()
			if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
				-- disable for .env files
				return false
			end
			return true
		end,
		["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
	},
}

M.setup = function()
	local ok, copilot = pcall(require, "copilot")
	if not ok then
		return
	end
	copilot.setup(M.config_copilot)

	local ok, copilot_cmp = pcall(require, "copilot_cmp")
	if not ok then
		return
	end
	copilot_cmp.setup(M.config_copilot_cmp)
end

return M
