local harpoon = require("harpoon")

harpoon:setup({})

-- Use the new Harpoon functions
vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end, { desc = "Harpoon: Add current file" })

vim.keymap.set("n", "<leader>d", function()
    harpoon:list():remove()
end, { desc = "Harpoon: Remove current file" })


-- local function toggle_telescope()
--     local conf = require("telescope.config").values
--     local harpoon_list = harpoon:list()
--     local file_paths = {}
--
--     for _, item in ipairs(harpoon_list.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end

-- vim.keymap.set("n", "<C-e>", toggle_telescope, { desc = "Open Harpoon window" })

vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)


-- Navigate between files
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })

vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon: Next file" })
vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon: Previous file" })
