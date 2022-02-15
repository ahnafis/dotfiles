local cmp = require('cmp')
local types = require('cmp.types')

cmp.setup({
    completion = {
        autocomplete = {
            types.cmp.TriggerEvent.InsertEnter,
            types.cmp.TriggerEvent.TextChanged
        },
        completeopt = "menu,menuone,noinsert",
        keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1
    },
    preselect = cmp.PreselectMode.None,
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {
            'i',
            's'
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {
            'i',
            's'
        })
    },
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
    }
})

cmp.setup.cmdline('/', {
    sources = {
        {name = 'buffer'}
    }
})

cmp.setup.cmdline(':', {
    sources = {
        --{ name = 'path' },
        { name = 'cmdline' }
    }
})
