-- ~/.config/nvim/lua/plugins/configs/autopairs.lua

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    lazy = false,
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
