-- ~/.config/nvim/lua/plugins/configs/nvim_transparent.lua

return {
  'xiyaowong/nvim-transparent',
  lazy = false,
  config = function()
    require("transparent").setup({
      enable = true, -- Enable transparency on startup
      extra_groups = { -- Additional groups that should be cleared
        -- Customize as needed. For example:
        "NormalFloat",      -- For floating windows
        "NvimTreeNormal",   -- If you use nvim-tree
        -- Add more groups if necessary
      },
      exclude = {}, -- Groups you don't want to clear
    })
  end,
}
