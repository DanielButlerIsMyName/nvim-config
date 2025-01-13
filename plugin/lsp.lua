-- Ensure Mason is installed and set up
require("mason").setup()

-- Ensure Mason-LSPConfig is installed and integrates with LSPConfig
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",       -- Lua
        "pyright",      -- Python
        "ts_ls",        -- TypeScript/JavaScript
        "bashls",       -- Bash
        "powershell_es",-- PowerShell
        "jsonls",       -- JSON
        "cssls",        -- CSS
        "tailwindcss",  -- Tailwind CSS
        "elixirls",     -- Elixir
        "csharp_ls",    -- C#
        "marksman",     -- Markdown
        "yamlls"        -- YAML
    },
    automatic_installation = true,
})

-- LSPConfig Setup
local lspconfig = require("lspconfig")
-- Common capabilities for autocompletion
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- On-Attach function for keybindings
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
