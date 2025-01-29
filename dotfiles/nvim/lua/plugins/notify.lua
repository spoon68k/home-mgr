-- ~/.config/nvim/lua/plugins/configs/nvim_notify.lua

return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      enabled = true,
    })
  end,
}

