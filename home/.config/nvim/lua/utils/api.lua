local map = vim.keymap.set

_G.autocmd = vim.api.nvim_create_autocmd

---@param group_name string
function _G.augroup(group_name)
    vim.api.nvim_create_augroup(group_name, { clear = true })
end

---@param name string
---@param commands string | fun(args: vim.api.keyset.create_user_command.command_args)
---@param opts?  vim.api.keyset.user_command
function _G.command(name, commands, opts)
    vim.api.nvim_create_user_command(name, commands, opts or {})
end

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts table|nil
local function noremap(mode, lhs, rhs, opts)
    opts = opts or {}
    local default_opts = { noremap = true }
    map(mode, lhs, rhs, vim.tbl_extend("keep", default_opts, opts))
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.nmap(lhs, rhs, opts)
    map("n", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.imap(lhs, rhs, opts)
    map("i", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.vmap(lhs, rhs, opts)
    map("v", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.nnoremap(lhs, rhs, opts)
    noremap("n", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.inoremap(lhs, rhs, opts)
    noremap("i", lhs, rhs, opts)
end

---@param lhs string
---@param rhs string|function
---@param opts table|nil
function _G.vnoremap(lhs, rhs, opts)
    noremap("v", lhs, rhs, opts)
end

---@param group_name string
---@param options vim.api.keyset.highlight
function _G.highlight(group_name, options)
    vim.api.nvim_set_hl(0, group_name, options or {})
end
