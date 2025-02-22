-- system dependant clipboard behaviour

vim.api.nvim_set_option_value("clipboard", "unnamedplus", {})

-- if we are on WSL, then use clip.exe and powershell.exe to handle copy/pasting

local function wsl_copy_paste()
    local c = vim.fn.executable(Env_Wsl_Clip) == 1
    local p = vim.fn.executable(Env_Wsl_PowerShell) == 1
    return (c and p)
end

if wsl_copy_paste() then
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
