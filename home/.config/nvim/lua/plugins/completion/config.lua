local cmp = require("cmp")
local cmp_auto_pairs = require("nvim-autopairs.completion.cmp")

local helpers = require("plugins.completion.helpers")
local icons = require("utils.icons")

cmp.event:on("confirm_done", cmp_auto_pairs.on_confirm_done())

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
    },

    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    ---@diagnostic disable-next-line: missing-fields
    formatting = {
        fields = { "kind", "abbr" },

        format = function(_, item)
            item.kind = icons.lsp_kinds[item.kind] or ""
            return item
        end,
    },

    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" },
        { name = "path" },
    }),

    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),

        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(helpers.on_tab, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(helpers.on_shift_tab, { "i", "s" }),
    }),
})
