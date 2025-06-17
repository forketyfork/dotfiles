-- Use with lspkind, luasnip, etc.
local cmp = require("cmp")
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    },
    snippet = {
        expand = function(args)
            require'luasnip'.lsp_expand(args.body)
        end,
    },

    mapping = {
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    },
}
