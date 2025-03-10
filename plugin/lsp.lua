-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true, -- Auto-install missing LSPs
})

-- LSP Setup
local lspconfig   = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  local buf_set_keymap = vim.api.nvim_buf_set_keymap

  buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap(bufnr, "n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
})

-- CMP Setup
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-p>"]     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-n>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "copilot", group_index = 2 },
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})
