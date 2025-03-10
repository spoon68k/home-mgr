
-- Find the dailiest directory for the active vault
local dailies_dir = nil
for name, note in pairs(Env_Obsidian_Vaults) do
    if vim.env.NVIM_ACTIVE_VAULT == name then
        dailies_dir = string.format("%s/%s/dailies", Env_Home, note:match("(.*/)"))
    end
end

-- If there is no selection (or it is invalid), disable the plug-in
if dailies_dir == nil then
    return {}
end

return {
    "spoon68k/calendar-nav",
    lazy = false,
    config = function()
        require("calendar-nav").setup({
            dailies_dir = dailies_dir,
            border = "rounded",
        })
    end
}

