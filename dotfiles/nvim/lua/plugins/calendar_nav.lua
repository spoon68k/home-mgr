return {
    "spoon68k/calendar-nav",
    lazy = false,
    config = function()
        require("calendar-nav").setup({
            dailies_dir = string.format("%s/%s/dailies", Env_Home, Env_Note_Vault),
            border = "rounded",
        })
    end
}

