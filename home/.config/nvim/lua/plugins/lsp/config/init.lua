local utils = require("utils")

local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local language_servers = require("plugins.lsp.config.server")

local language_server_capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}

language_server_capabilities =
    utils.merge(language_server_capabilities, completion_capabilities)

---@type lspconfig.Config
---@diagnostic disable-next-line: missing-fields
local default_server_options = {
    capabilities = language_server_capabilities,
}

---@param server_name string
local function setup_lsp(server_name)
    ---@type table<string, lspconfig.Config>
    local server_options =
        utils.merge(default_server_options, language_servers[server_name] or {})

    vim.lsp.config(server_name, server_options)
    vim.lsp.enable(server_name)
end

---@type MasonLspconfigSettings
mason_lspconfig.setup({ setup_lsp })

-- Diagnostics config:
require("plugins.lsp.config.core")
