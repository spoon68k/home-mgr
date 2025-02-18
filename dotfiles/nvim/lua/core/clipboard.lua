-- system dependant clipboard behaviour

vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})

-- if we are on WSL, then use clip.exe and powershell.exe to handle copy/pasting

if vim.fn.executable(Env_Wsl_Clip) and vim.fn.executable(Env_Wsl_PowerShell) then

    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ['+'] = Env_Wsl_Clip,
            ['*'] = Env_Wsl_Clip,
        },
        paste = {
            ['+'] = Env_Wsl_PowerShell .. ' -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
            ['*'] = Env_Wsl_PowerShell .. ' -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("\r", ""))',
        },
        cache_enabled = 0,
    }

end

--   local opts = {
--     callback = function()
--       if vim.v.event.operator ~= "y" then
--         return
--       end
--       vim.fn.system(Env_Wsl_Clip, vim.fn.getreg(0))
--     end
--   }
-- 
--   opts.group = vim.api.nvim_create_augroup("WSLYank", {})
--   vim.api.nvim_create_autocmd("TextYankPost", { group = opts.group, callback = opts.callback })
-- end

