-- system dependant clipboard behaviour

vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})

-- if we are on WSL, then use clip.exe to allow copying to the windows side.

if vim.fn.executable(Env_Wsl_Clip) then
  local opts = {
    callback = function()
      if vim.v.event.operator ~= "y" then
        return
      end
      vim.fn.system(Env_Wsl_Clip, vim.fn.getreg(0))
    end
  }

  opts.group = vim.api.nvim_create_augroup("WSLYank", {})
  vim.api.nvim_create_autocmd("TextYankPost", { group = opts.group, callback = opts.callback })
end

