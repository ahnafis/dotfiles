vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup(
    "setup_python_indentation",
    { clear = true }
  ),
  pattern = "*.py",
  callback = function()
    vim.opt_local.tabstop = 4
  end,
})
