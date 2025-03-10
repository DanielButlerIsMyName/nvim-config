-- Line Numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Display & UI
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

-- Performance
vim.opt.updatetime = 50

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- File Handling
vim.opt.swapfile = false
vim.opt.backup = false

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

