-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true,
})
require("mason-tool-installer").setup({
  ensure_installed = { "lua_ls", "stylua", "ts_ls", "omnisharp", "gopls" },
})

-- LSP Setup
local lspconfig   = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- on_attach function with both old and new keybinds
local on_attach = function(client, bufnr)
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
  end

  -- Old keybinds (preserved)
  map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
  map("K", vim.lsp.buf.hover, "[H]over")
  map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", "n")

  -- New/extended keybinds (using Telescope for improved UX)
  map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- Optional: Toggle inlay hints if the server supports them
  if client.supports_method and client.supports_method("textDocument/inlayHint") then
    map("<leader>th", function()
      local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
    end, "[T]oggle Inlay [H]ints")
  end
end

-- Define servers and their settings
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  ts_ls = {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    init_options = {
      hostInfo = "neovim",
    },
  },
  -- You can add additional server configurations here, e.g. for omnisharp or gopls.
}

-- Setup each server
for server, config in pairs(servers) do
  config.capabilities = capabilities
  config.on_attach = on_attach
  lspconfig[server].setup(config)
end
