-- ~/.config/nvim/lua/plugins/configs/indent_blankline.lua

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    opts = {},
    config = function()
        require("ibl").setup()
    end
}
