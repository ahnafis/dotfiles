-- TODO: Add descriptions.

local map = vim.keymap.set

---@param mode string
---@param lhs string
---@param rhs string|function
---@param opts? vim.keymap.set.Opts
local function noremap(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { noremap = true }
    map(mode, lhs, rhs, vim.tbl_extend("keep", default_opts, opts))
end

---@type utils.map.args
function _G.nmap(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
end

---@type utils.map.args
function _G.imap(lhs, rhs, opts)
    map("i", lhs, rhs, opts)
end

---@type utils.map.args
function _G.vmap(lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

---@type utils.map.args
function _G.nnoremap(lhs, rhs, opts)
    noremap("n", lhs, rhs, opts)
end

---@type utils.map.args
function _G.inoremap(lhs, rhs, opts)
    noremap("i", lhs, rhs, opts)
end

---@type utils.map.args
function _G.vnoremap(lhs, rhs, opts)
    noremap("v", lhs, rhs, opts)
end

_G.autocmd = vim.api.nvim_create_autocmd

---@param group_name string
function _G.augroup(group_name)
    vim.api.nvim_create_augroup(group_name, { clear = true })
end

---@type utils.highlight.args
function _G.highlight(group_name, options)
    vim.api.nvim_set_hl(0, group_name, options or {})
end

---@type utils.command.args
function _G.command(name, commands, opts)
    vim.api.nvim_create_user_command(name, commands, opts or {})
end
