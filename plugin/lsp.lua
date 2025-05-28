-- 1) Mason & Mason-LSPConfig
require("mason").setup()
require("mason-tool-installer").setup({
  -- if you want extra formatters/linters installed, list them here:
  ensure_installed = { "lua_ls", "stylua", "ts_ls", "omnisharp", "gopls" },
  auto_update    = true,
  run_on_start   = true,
})

require("mason-lspconfig").setup({
  ensure_installed    = { "ts_ls", "omnisharp" },
  automatic_installation = true,
})

-- 2) LSPConfig + completion capabilities
local lspconfig    = require("lspconfig")
local util         = require("lspconfig.util")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 3) on_attach for all servers
local on_attach = function(client, bufnr)
  local map = function(keys, fn, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, fn, { buffer = bufnr, desc = desc })
  end

  -- basic LSP mappings
  map("gd", vim.lsp.buf.definition,     "[G]oto [D]efinition")
  map("K",  vim.lsp.buf.hover,          "[H]over")
  map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
  map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

  -- optional: toggle inlay hints
  if client.supports_method("textDocument/inlayHint") then
    map("<leader>th", function()
      local opts = { bufnr = bufnr }
      if vim.lsp.inlay_hint.is_enabled(opts) then
        vim.lsp.inlay_hint.disable(opts)
      else
        vim.lsp.inlay_hint.enable(opts)
      end
    end, "[T]oggle [H]ints")
  end
end

-- 4) Mason-LSPConfig handlers: default + per-server overrides
require("mason-lspconfig").setup_handlers {
  -- default handler (for any server without a custom block)
  function(server_name)
    lspconfig[server_name].setup {
      on_attach    = on_attach,
      capabilities = capabilities,
    }
  end,

  -- Typescript / JS
  ["ts_ls"] = function()
    lspconfig.ts_ls.setup {
      on_attach    = on_attach,
      capabilities = capabilities,
      filetypes    = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      init_options = { hostInfo = "neovim" },
    }
  end,

  -- C# / .NET
  ["omnisharp"] = function()
    lspconfig.omnisharp.setup {
      on_attach    = on_attach,
      capabilities = capabilities,
      cmd = {
        -- point at Mason’s installed OmniSharp binary:
        vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp",
        "--languageserver",
        "--hostPID", tostring(vim.fn.getpid()),
      },
      filetypes = { "cs" },
      root_dir  = util.root_pattern("*.sln", "*.csproj", ".git"),
      settings = {
        omnisharp = {
          useModernNet = true,  -- prefers .NET 6+ if installed
          -- sdkPath = "/custom/dotnet/path",  -- only if you need it
        },
      },
    }
  end,
}
