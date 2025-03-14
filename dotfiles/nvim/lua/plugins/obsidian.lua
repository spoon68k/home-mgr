
-- Convert the config table to the desired workspaces format
local workspaces = {}
for name, note in pairs(Env_Obsidian_Vaults) do
    if vim.env.NVIM_ACTIVE_VAULT == name then
        table.insert(workspaces, { name = name, path = Env_Home .. '/' .. note })
    end
end

-- If there is no selection (or it is invalid), disable the plug-in
if next(workspaces) == nil then
    return {}
end

-- Setup for the chosen workspace (vault)
return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        require("obsidian").setup({
            workspaces = workspaces,
            daily_notes = {
                -- Optional, if you keep daily notes in a separate directory.
                folder = "dailies",
                -- Optional, if you want to change the date format for the ID of daily notes.
                date_format = "%Y-%m-%d",
                -- Optional, if you want to change the date format of the default alias of daily notes.
                alias_format = "%B %-d, %Y",
                -- Optional, default tags to add to each new daily note created.
                default_tags = { "Daily-Notes" },
                -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                template = nil
            },
            -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
            completion = {
                -- Set to false to disable completion.
                nvim_cmp = true,
                -- Trigger completion at 2 chars.
                min_chars = 2,
            },
            -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
            -- way then set 'mappings = {}'.
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                ["gf"] = {
                    action = function()
                        return require("obsidian").util.gf_passthrough()
                    end,
                    opts = { noremap = false, expr = true, buffer = true },
                },
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                }
            },

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                note_mappings = {
                    -- Create a new note from your query.
                    new = "<C-x>",
                    -- Insert a link to the selected note.
                    insert_link = "<C-l>",
                },
                tag_mappings = {
                    -- Add tag(s) to current note.
                    tag_note = "<C-x>",
                    -- Insert a tag at the current location.
                    insert_tag = "<C-l>",
                },
            },

            follow_url_func = function(url)
                if vim.fn.executable(Env_Wsl_Clip) then
                    vim.fn.system(Env_Wsl_Clip, url)
                    vim.notify("URL copied to clipboard: " .. url)
                end
            end,

            -- Optional, sort search results by "path", "modified", "accessed", or "created".
            -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
            -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
            sort_by = "modified",
            sort_reversed = true,

            -- Set the maximum number of lines to read from notes on disk when performing certain searches.
            search_max_lines = 1000,
        })
    end
}
