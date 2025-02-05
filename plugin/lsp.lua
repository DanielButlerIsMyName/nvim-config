require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "pyright", "ts_ls", "bashls", "powershell_es", "jsonls", "cssls", "tailwindcss", "elixirls", "csharp_ls", "marksman", "yamlls"
    },
    automatic_installation = true,
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    local buf_set_keymap = function(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.eslint.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })

-- Autocompletion
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    })
})
