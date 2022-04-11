local M = {}

M.config = {
	ensure_installed = {
		"vim",
		"lua",
	},
	ignore_install = {},
	sync_install = true,
}

M.setup = function()
	local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
	if not status_ok then
		return
	end
	treesitter_configs.setup(M.config)
end

return M
