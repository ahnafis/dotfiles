autocmd("TextYankPost", {
  group = augroup("highlight_yank", {
    clear = true,
  }),

  desc = "Highlight yanked text",

  callback = function()
    vim.highlight.on_yank()
  end,
})

---@type LazySpec
return {
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter" },
  { "folke/todo-comments.nvim", opts = {} },

  -- Color scheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("plugins.syntax.color_scheme")
    end,
  },
}
