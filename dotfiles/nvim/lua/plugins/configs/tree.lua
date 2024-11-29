-- ~/.config/nvim/lua/plugins/configs/tree.lua

return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    requires = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set('n', 'e',     api.tree.toggle,                     opts('Toggle'))
            vim.keymap.set('n', '<C-p>', api.tree.change_root_to_parent,      opts('Parent Root'))
            vim.keymap.set('n', '<C-n>', api.tree.change_root_to_node,        opts('Change Root'))
            vim.keymap.set('n', '?',     api.tree.toggle_help,                opts('Help'))
            vim.keymap.set('n', 'l',     api.node.open.edit,                  opts('Open'))
        end

        -- Function to open NvimTree automatically when opening a directory
        local function open_nvim_tree(data)
            -- Check if the buffer is a directory
            local directory = vim.fn.isdirectory(data.file) == 1

            if not directory then
                return
            end

            -- Change to the directory
            vim.cmd.cd(data.file)

            -- Open NvimTree
            require("nvim-tree.api").tree.open()
        end

        require("nvim-tree").setup({
            on_attach = my_on_attach,
            hijack_directories = {
                enable = false,
            },
            filters = {
                custom = { ".git" },
                exclude = { ".gitignore", ".env" },
            },
            update_cwd = true,
            renderer = {
                add_trailing = false,
                group_empty = false,
                highlight_git = false,
                highlight_opened_files = "none",
                root_folder_modifier = ":t",
                indent_markers = {
                    enable = false,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = false,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            diagnostics = {
                 enable = true,
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {},
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 500,
            },
            view = {
                width = 30,
                side = "left",
                number = false,
                relativenumber = false,
            },
        })

        vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end
}

