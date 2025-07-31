return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- Enable file-type icons
            require("nvim-web-devicons").setup{
                default = true,
            }
        end,
    },
}
