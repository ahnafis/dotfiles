local icons = require("utils.icons")
local schemastore = require("schemastore")
local mason_lspconfig = require("mason-lspconfig")

-- LSP diagnostics configurations.
---@type vim.diagnostic.Opts
local options = {}

options.virtual_text = false

options.signs = {
	text = {
		[vim.diagnostic.severity.ERROR] = icons.error,
		[vim.diagnostic.severity.WARN] = icons.warning,
		[vim.diagnostic.severity.INFO] = icons.info,
		[vim.diagnostic.severity.HINT] = icons.circle,
	},
}

vim.diagnostic.config(options)

-- Language specific server settings.
vim.lsp.config("jsonls", {
	settings = {
		json = { schemas = schemastore.json.schemas() },
	},
})

vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			schemaStore = { enable = false, url = "" },
			schemas = schemastore.yaml.schemas(),
		},
	},
})

-- Bridge the language servers to the editor.
mason_lspconfig.setup({ automatic_enable = true })
