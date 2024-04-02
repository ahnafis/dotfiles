local icons = require("utils.icons")
local utils = require("utils")

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local lsp_config = require("lspconfig")

local language_server_capabilities = vim.lsp.protocol.make_client_capabilities()
local completion_capabilities = cmp_nvim_lsp.default_capabilities() or {}

local schemastore = require("schemastore")

---@type lspconfig.Config
local default_server_options = {
  capabilities = utils.merge(
    language_server_capabilities,
    completion_capabilities
  ),
}

---@type table<string, lspconfig.Config>
local language_servers = {}

-- LSP diagnostics configuration:
local diagnostic_signs = {
  Error = icons.error,
  Warn = icons.warning,
  Hint = icons.circle,
  Info = icons.info,
}

vim.diagnostic.config({ virtual_text = false })

for sign_type, icon in pairs(diagnostic_signs) do
  local group = "DiagnosticSign" .. sign_type
  vim.fn.sign_define(group, { text = icon, texthl = group, numhl = group })
end

-- Mason configuration:
-- TODO: Separate these icons
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
})

language_servers.jsonls = {
  settings = {
    json = { schemas = schemastore.json.schemas() },
  },
}

language_servers.yamlls = {
  settings = {
    yaml = {
      schemaStore = { enable = false, url = "" },
      schemas = schemastore.yaml.schemas(),
    },
  },
}

require("mason-lspconfig").setup_handlers({
  ---@param server_name string
  function(server_name)
    ---@type table<string, lspconfig.Config>
    local server_options =
      utils.merge(default_server_options, language_servers[server_name] or {})

    lsp_config[server_name].setup(server_options)
  end,

  lua_ls = function()
    require("neodev").setup({})
    lsp_config.lua_ls.setup(language_servers.lua_ls or {})
  end,
})

require("mason-tool-installer").setup({
  ensure_installed = {
    -- Language servers
    "clangd",
    "tsserver",
    "pyright",
    "lua_ls",
    "bashls",
    "jsonls",
    "yamlls",

    -- Linters
    "cpplint",
    "eslint",
    "markdownlint",
    "shellcheck",

    -- Formatters
    "clang-format",
    "prettierd",
    "autopep8",
    "stylua",
  },
})
