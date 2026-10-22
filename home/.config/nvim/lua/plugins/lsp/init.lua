local paths = require("utils.paths")
local options = require("plugins.lsp.installer")

---@type lazydev.Config
local lazydev_options = {
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		{ path = "$VIMRUNTIME", words = { "vim" } },
		{ path = paths.plugins },
	},
}

---@type LazySpec
return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},

		config = function()
			require("plugins.lsp.config")
			require("plugins.lsp.keymaps")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/SchemaStore.nvim",
			"folke/lazydev.nvim",
		},
	},

	{
		"mason-org/mason.nvim",
		opts = options.mason,
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = options.mason_tool_installer,
	},

	{
		"folke/lazydev.nvim",
		opts = lazydev_options,
	},
}
