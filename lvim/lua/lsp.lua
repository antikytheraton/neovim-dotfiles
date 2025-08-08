-- LSP callback keymaps
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufrn)
	-- local function buf_set_option(...)
	-- 	vim.api.nvim_buf_set_option(bufrn, ...)
	-- end
	-- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufrn, ...)
	end

	buf_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

	if client.server_capabilities.document_formatting then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	elseif client.server_capabilities.document_range_formatting then
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end
end

lvim.lsp.on_attach_callback = on_attach

require("lspconfig").yamlls.setup({
	settings = {
		yaml = {
			schemaStore = {
				url = "https://www.schemastore.org/api/json/catalog.json",
				enable = true,
			},
			schemas = {
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/*docker-compose*.y*ml",
				["https://json.schemastore.org/circleciconfig.json"] = "/*circle*.y*ml",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.22.0/all.json"] = "k8s/**",
				["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
					"ci/*.yml",
					".gitlab-ci.yml",
				},
			},
		},
	},
})

require("lspconfig").sqls.setup({
	on_attach = function(client, bufnr)
		require("sqls").on_attach(client, bufnr) -- require sqls.nvim
	end,
	settings = {
		sqls = {
			connections = {
				{
					driver = "postgresql",
					dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=postgres dbname=postgres sslmode=disable",
				},
			},
		},
	},
})

