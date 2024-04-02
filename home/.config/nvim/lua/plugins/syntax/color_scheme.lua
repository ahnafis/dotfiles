local gruvbox = require("gruvbox")

gruvbox.setup({
  bold = false,

  ---@diagnostic disable-next-line: missing-fields
  italic = { strings = false },

  contrast = "hard",
  overrides = {
    SignColumn = { bg = gruvbox.palette.dark0_hard },
    DiagnosticSignError = { link = "GruvboxRed" },
    DiagnosticSignWarn = { link = "GruvboxYellow" },
    DiagnosticSignInfo = { link = "GruvboxBlue" },
    DiagnosticSignHint = { link = "GruvboxAqua" },
  },
})

vim.cmd.colorscheme("gruvbox")
