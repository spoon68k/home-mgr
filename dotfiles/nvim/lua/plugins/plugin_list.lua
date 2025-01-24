-- List of plugsin

-- ~/.config/nvim/lua/plugins/plugin_list.lua

return {
--  -- Markdown and Writing
--  require('plugins.configs.markdown_nvim'),
--  require('plugins.configs.markdown_preview'),
    require('plugins.configs.obsidian'),                    -- Obsidian plugin
--  require('plugins.configs.vim_pencil'),
--  require('plugins.configs.zen_mode'),
--
    -- Navigation and Productivity
    require('plugins.configs.copilot'),                     -- Github copilot plugin
    require('plugins.configs.tree'),                        -- File explorer
    require('plugins.configs.harpoon'),                     -- Awesome mark manager
    require('plugins.configs.goto_preview'),                -- Preview LSP definitions
    require('plugins.configs.telescope'),                   -- Find, filter, preview, pick...
--
--  -- Git Integration
--  require('plugins.configs.git_worktree'),
--  require('plugins.configs.neogit'),
--  require('plugins.configs.gitsigns'),
--  require('plugins.configs.vim_fugitive'),
--
--  -- LSP and Autocompletion
    require('plugins.configs.treesitter'),                  -- Syntax highlighting
    require('plugins.configs.lsp_config'),                  -- LSP configuration
    require('plugins.configs.luasnip'),                     -- Snip engine
    require('plugins.configs.cmp'),                         -- Completion engine
    require('plugins.configs.lspkind'),                     -- Prettify the LSP suggestion panel
--  require('plugins.configs.cmp_lsp'),
--  require('plugins.configs.nvim_dap_ui'),
--  require('plugins.configs.nvim_dap_virtual_text'),
--  require('plugins.configs.nvim_dap_go'),

    -- UI Enhancements
    require('plugins.configs.catppuccin'),                  -- Theming
    require('plugins.configs.dev_webicons'),                -- Additional icons
    require('plugins.configs.lualine'),                     -- Status bar
    require('plugins.configs.indent_blankline'),            -- Highlights identing
    require('plugins.configs.transparent'),                 -- Transparent backdrops
    require('plugins.configs.noice'),                       -- Popup menu replacement
    require('plugins.configs.notify'),                      -- Fancy notifications
    require('plugins.configs.twilight'),                    -- Dims inactive areas
--
--  -- Utilities
--  require('plugins.configs.codeium'),
--  require('plugins.configs.codesnap'),
    require('plugins.configs.autopairs'),
    require('plugins.configs.comment'),
    require('plugins.configs.sort'),
    require('plugins.configs.tabular'),
    require('plugins.configs.toggleterm'),
--  require('plugins.configs.vim_sleuth'),
--  require('plugins.configs.todo_comments'),
--  require('plugins.configs.trouble'),
--  require('plugins.configs.vim_surround'),
--  require('plugins.configs.vim_obsession'),
--  require('plugins.configs.go_nvim'),
--  require('plugins.configs.nvim_dap_virtual_text'),
}
