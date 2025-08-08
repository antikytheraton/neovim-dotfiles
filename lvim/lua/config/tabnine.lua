local M = {}

M.config = {
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
	show_prediction_strength = false,
	min_percent = 0,
}

M.setup = function()
	-- this function configures the tabnine behavior
	local ok, tabnine = pcall(require, "cmp_tabnine.config")
	if not ok then
		return
	end
	tabnine:setup(M.config)
end

M.prefetch = function()
	local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })
	vim.api.nvim_create_autocmd("BufRead", {
		group = prefetch,
		pattern = "*.py",
		callback = function()
			require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
		end,
	})
end

return M
