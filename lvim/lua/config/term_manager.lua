local M = {}

M.setup = function()
	local ok, toggleterm_manager = pcall(require, "toggleterm-manager")
	if not ok then
		return
	end

	local actions = toggleterm_manager.actions

	toggleterm_manager.setup({
		mappings = {
			i = {
				["<CR>"] = { action = actions.create_and_name_term, exit_on_action = true },
				["<C-d>"] = { action = actions.delete_term, exit_on_action = false },
			},
			n = {
				["<CR>"] = { action = actions.create_and_name_term, exit_on_action = true },
				["x"] = { action = actions.delete_term, exit_on_action = false },
			},
		},
	})
end

return M
