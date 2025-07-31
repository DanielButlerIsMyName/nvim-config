return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

        config = function()
            local harpoon = require("harpoon")
            harpoon.setup({})

            -- Add / remove current file
            vim.keymap.set("n", "<leader>a", function()
                harpoon:list():add()
            end, { desc = "Harpoon: Add current file" })

            vim.keymap.set("n", "<leader>d", function()
                harpoon:list():remove()
            end, { desc = "Harpoon: Remove current file" })

            -- Toggle quick menu
            vim.keymap.set("n", "<C-e>", function()
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end, { desc = "Harpoon: Toggle quick menu" })

            -- Navigate between marked files
            vim.keymap.set("n", "<C-j>", function()
                harpoon:list():select(1)
            end, { desc = "Harpoon: Go to file 1" })

            vim.keymap.set("n", "<C-k>", function()
                harpoon:list():select(2)
            end, { desc = "Harpoon: Go to file 2" })

            vim.keymap.set("n", "<C-l>", function()
                harpoon:list():select(3)
            end, { desc = "Harpoon: Go to file 3" })

            vim.keymap.set("n", "<C-n>", function()
                harpoon:list():next()
            end, { desc = "Harpoon: Next file" })

            vim.keymap.set("n", "<C-p>", function()
                harpoon:list():prev()
            end, { desc = "Harpoon: Previous file" })
        end,
    },
}
