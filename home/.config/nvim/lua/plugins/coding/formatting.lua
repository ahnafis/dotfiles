---@type conform.setupOpts
return {
    async = true,
    notify_on_error = false,

    format_on_save = {
        timeout_ms = 5000,
        lsp_format = "fallback",
    },

    formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cmake = { "cmake_format" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettierd" },
        python = { "autopep8" },
        markdown = { "prettierd" },
    },
}
