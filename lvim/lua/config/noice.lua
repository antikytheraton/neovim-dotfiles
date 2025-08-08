local M = {}

-- M.background_colour = "#1a1b26"
M.background_colour = "#06101e"

M.config = {
	background_colour = M.background_colour,
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	-- Macros notification
	routes = {
		{
			filter = {
				event = "notify",
				find = "No information available",
			},
			opts = { skip = true },
		},
	},
}

M.setup = function()
	local ok, noice = pcall(require, "noice")
	if not ok then
		return
	end
	local ok, notify = pcall(require, "notify")
	if not ok then
		return
	end
	notify.setup({
		background_colour = M.background_colour,
	})
	noice.setup(M.config)
end

return M
