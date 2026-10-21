local M = {}

-- A `vim.fn.feedkeys()` wrapper.
---@param mode string
---@param key string
---@return nil
function M.feedkeys(mode, key)
    local term_code = vim.api.nvim_replace_termcodes(key, true, true, true)
    vim.api.nvim_feedkeys(term_code, mode, true)
end

-- A `vim.tbl_deep_extend()` wrapper.
---@param ... table
---@return table
function M.merge(...)
    return vim.tbl_deep_extend("force", ...)
end

M.file_types = {
    asm = "Assembly",
    cpp = "C++",
    css = "CSS",
    html = "HTML",
    javascript = "JavaScript",
    javascriptreact = "JavaScript",
    json = "JSON",
    jsonc = "JSON with Comments",
    php = "PHP",
    scss = "S(CSS)",
    typescript = "TypeScript",
    typescriptreact = "TypeScript",
    lua = "Lua",
    vim = "Vim",
}

---@param file_type string
function M.get_file_type(file_type)
    return M.file_types[file_type] or file_type
end

return M
