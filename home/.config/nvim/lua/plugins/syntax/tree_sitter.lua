---@diagnostic disable-next-line: missing-fields

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
        enable = true,
    },
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
        "python",
        "regex",
        "sql",
        "tsx",
        "typescript",
        "yaml",
    },
})
