local map = vim.keymap.set
_G.augroup = vim.api.nvim_create_augroup
_G.autocmd = vim.api.nvim_create_autocmd

---@param mode string|table
---@param lhs string
---@param rhs string|function
---@param opts table|nil
local function noremap(mode, lhs, rhs, opts)
  opts = opts or {}
  map(mode, lhs, rhs, vim.tbl_extend("keep", { noremap = true }, opts))
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
