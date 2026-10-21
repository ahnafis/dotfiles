---@type Gruvbox
local gruvbox = require("gruvbox")

-- local custom_palette = {
--     bg = "#0F1419", -- Taken from Ayu Dark
--     fg = "#E6E1CF", -- Taken from Ayu Dark
-- }

gruvbox.setup({
    ---@diagnostic disable-next-line: missing-fields
    italic = { strings = false },
    bold = false,

    invert_selection = true,
    contrast = "hard",

    overrides = {
        SignColumn = { bg = gruvbox.palette.dark0_hard },
        StatusLine = {
            bg = gruvbox.palette.dark1,
            fg = gruvbox.palette.light2,
        },

        DiagnosticSignError = { link = "GruvboxRed" },
        DiagnosticSignWarn = { link = "GruvboxYellow" },
        DiagnosticSignInfo = { link = "GruvboxBlue" },
        DiagnosticSignHint = { link = "GruvboxBlue" },

        TabLineSel = { link = "Normal" },

        Structure = { fg = gruvbox.palette.bright_red },
        StorageClass = { fg = gruvbox.palette.bright_red },
        cStructure = { fg = gruvbox.palette.bright_red },
        cppModifier = { fg = gruvbox.palette.bright_red },

        Function = { fg = gruvbox.palette.bright_yellow },

        Type = { fg = gruvbox.palette.bright_orange },
        TypeDef = { link = "Type" },
        ["@class"] = { link = "Type" },

        ["@variable"] = { link = "@parameter" },
        ["@namespace"] = { link = "@macro" },
    },
})

vim.cmd.colorscheme("gruvbox")
