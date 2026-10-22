-- TODO: Add descriptions.

local map = vim.keymap.set

local M = {}

function M.nmap(lhs, rhs, opts)
	map("n", lhs, rhs, opts)
end

function M.imap(lhs, rhs, opts)
	map("i", lhs, rhs, opts)
end

function M.vmap(lhs, rhs, opts)
	map("v", lhs, rhs, opts)
end

M.autocmd = vim.api.nvim_create_autocmd

function M.augroup(group_name, opts)
	return vim.api.nvim_create_augroup(group_name, opts or {})
end

return M
