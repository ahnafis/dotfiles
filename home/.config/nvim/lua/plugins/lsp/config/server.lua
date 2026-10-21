local schemastore = require("schemastore")

---@type table<string, lspconfig.Config>
local M = {}

---@diagnostic disable-next-line: missing-fields
M.jsonls = {
    settings = {
        json = { schemas = schemastore.json.schemas() },
    },
}

---@diagnostic disable-next-line: missing-fields
M.yamlls = {
    settings = {
        yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = schemastore.yaml.schemas(),
        },
    },
}

return M
