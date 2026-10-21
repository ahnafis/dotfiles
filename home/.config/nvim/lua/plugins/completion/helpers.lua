local M = {}

local cmp = require("cmp")
local feedkeys = require("utils").feedkeys

---@param fallback function
function M.on_tab(fallback)
    local is_snippet_available = vim.fn["vsnip#available"](1) == 1

    if cmp.visible() then
        cmp.select_next_item()
    elseif is_snippet_available then
        feedkeys("<Plug>(vsnip-expand-or-jump)", "")
    else
        fallback()
    end
end

---@param fallback function
function M.on_shift_tab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkeys("<Plug>(vsnip-jump-prev)", "")
    else
        fallback()
    end
end

---@param fallback function
function M.on_enter(fallback)
    if cmp.visible() then
        cmp.mapping.confirm()
    else
        fallback()
    end
end

return M
