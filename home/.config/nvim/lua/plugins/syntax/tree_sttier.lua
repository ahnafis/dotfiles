---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "asm",
    "bash",
    "c",
    "cmake",
    "cpp",
    "html",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    "regex",
    "sql",
    "tsx",
    "typescript",
    "yaml",
  },
})
