-- ~/.config/nvim/lua/plugins/configs/telescope_fzf_native.lua

return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'make',
  cond = vim.fn.executable 'make' == 1,
}

