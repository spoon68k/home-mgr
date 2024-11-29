-- Install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with plugins and UI configuration
require('lazy').setup('plugins.plugin_list', {
  ui = {
    border = "single",
    size = {
      width = 0.8,
      height = 0.8,
    },
  },
})

vim.cmd [[colorscheme catppuccin-macchiato]]
