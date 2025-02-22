return {
    "spoon68k/auto-save",
    lazy = false,
    config = function()
      require("auto-save").setup({
          debounce_time = tonumber(vim.env.NVIM_AUTOSAVE) or 0,
      })
    end
}

