local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Core Plugins
  {'nvim-lua/plenary.nvim'},
  {'nvim-tree/nvim-web-devicons', config = function()
    require("nvim-web-devicons").setup({ default = true })
  end},

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- File Manager
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {"echasnovski/mini.icons", "nvim-tree/nvim-web-devicons"},
  },

  -- Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- Commenting
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"  }
  },

  -- LSP & Autocompletion
  {'neovim/nvim-lspconfig'},
  {'williamboman/mason.nvim', config = true},
  {'williamboman/mason-lspconfig.nvim'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'L3MON4D3/LuaSnip'},
  {'saadparwaiz1/cmp_luasnip'},

  -- GitHub Copilot
  -- {
  --   "github/copilot.vim",
  -- },
})

