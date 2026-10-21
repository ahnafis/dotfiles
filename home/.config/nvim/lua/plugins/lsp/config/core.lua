local icons = require("utils.icons")

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
