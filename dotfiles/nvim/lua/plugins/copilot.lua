-- ~/.config/nvim/lua/plugins/configs/comment.lua

if Env_Copilot_Enabled then

    return {
        "zbirenbaum/copilot.lua",
--        cmd = "Copilot",
--        event = "InsertEnter",
        lazy = false,
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
                filetypes = {
                    markdown = true,

                }
            })
        end,
    }

else
    return { }
end

