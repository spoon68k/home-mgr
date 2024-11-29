-- ~/.config/nvim/lua/plugins/configs/lualine.lua

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { "folke/noice.nvim", 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()

        -- Require the existing theme
        local custom_theme = require('lualine.themes.catppuccin-macchiato')

        -- Change the background color for normal mode, section c
        custom_theme.normal.c.bg = '#4E4E4E' -- Replace with your desired grey color

        require("lualine").setup {
            options = {
                theme = custom_theme,
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    {
                        require("noice").api.status.command.get,
                        cond = require("noice").api.status.command.has,
                        color = { fg = "#ff9e64" },
                    },
                },
                lualine_a = {
                    {
                        'buffers',
                    }
                }
           }
        }
    end
}

