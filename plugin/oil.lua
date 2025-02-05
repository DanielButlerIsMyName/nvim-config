-- Enable icons for files
require("nvim-web-devicons").setup({
  default = true,
})

-- Configure oil.nvim
require("oil").setup({
  -- Use Oil as the default file explorer
  default_file_explorer = true,

  -- Move deleted files to trash
  delete_to_trash = true,

  -- Skip confirmation for simple edits
  skip_confirm_for_simple_edits = true,

  -- Prompt to save changes when selecting a new/moved/renamed file
  prompt_save_on_select_new_entry = true,

  -- Auto-delete hidden buffers after a delay (set false to disable)
  cleanup_delay_ms = 2000,

  -- Enable LSP file operations with a timeout
  lsp_file_methods = {
    enabled = true,
    timeout_ms = 1000,
    autosave_changes = false, -- Set to "unmodified" to only save unmodified buffers
  },

  -- Constrain cursor movement
  constrain_cursor = "editable",

  -- Watch the filesystem for changes
  watch_for_changes = true,

  -- Keymaps in Oil buffer
  keymaps = {
    ["g?"] = { "actions.show_help", mode = "n" },
    ["<CR>"] = "actions.select",
    ["<C-s>"] = { "actions.select", opts = { vertical = true } },
    ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
    ["<C-t>"] = { "actions.select", opts = { tab = true } },
    ["<C-c>"] = { "actions.close", mode = "n" },
    ["<C-l>"] = "actions.refresh",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
    ["`"] = { "actions.cd", mode = "n" },
    ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
    ["gs"] = { "actions.change_sort", mode = "n" },
    ["gx"] = "actions.open_external",
    ["g."] = { "actions.toggle_hidden", mode = "n" },
    ["g\\"] = { "actions.toggle_trash", mode = "n" },
  },

  -- Enable default keymaps
  use_default_keymaps = false,

  -- View options
  view_options = {
    show_hidden = true,
    is_hidden_file = function(name, bufnr)
      return name == "." or name == ".." -- Hide only `.` and `..`
    end,
    is_always_hidden = function(name, bufnr)
      return false
    end,
    natural_order = "fast", -- Human-friendly sorting
    case_insensitive = false,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
    highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
      return nil
    end,
  },

  -- Git integration
  git = {
    add = function(path) return true end,
    mv = function(src, dest) return true end,
    rm = function(path) return true end,
  },

  -- Floating preview window
  preview_win = {
    update_on_cursor_moved = true,
    preview_method = "fast_scratch",
    disable_preview = function(filename) return false end,
    win_options = {},
  },

  -- Floating confirmation window
  confirmation = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    max_height = 0.9,
    min_height = { 5, 0.1 },
    border = "rounded",
    win_options = { winblend = 0 },
  },

  -- Floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    border = "rounded",
    minimized_border = "none",
    win_options = { winblend = 0 },
  },

  -- Floating SSH window
  ssh = { border = "rounded" },

  -- Floating keymaps help window
  keymaps_help = { border = "rounded" },
})

-- Keymap to open Oil file explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
