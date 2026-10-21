local M = {}

---@type MasonSettings
M.mason = {}

M.mason_tool_installer = {
    ensure_installed = {
        -- Language servers
        "clangd",
        "typescript-language-server",
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
}

return M
