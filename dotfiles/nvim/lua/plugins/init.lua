-- List of plugsin

-- ~/.config/nvim/lua/plugins/plugin_list.lua

return {
--  -- Markdown and Writing
--  require('plugins.markdown_nvim'),
--  require('plugins.markdown_preview'),
    require('plugins.obsidian'),                    -- Obsidian plugin
--  require('plugins.vim_pencil'),
--  require('plugins.zen_mode'),
--
    -- Navigation and Productivity
    require('plugins.copilot'),                     -- Github copilot plugin
    require('plugins.tree'),                        -- File explorer
    require('plugins.harpoon'),                     -- Awesome mark manager
    require('plugins.goto_preview'),                -- Preview LSP definitions
    require('plugins.telescope'),                   -- Find, filter, preview, pick...
--
--  -- Git Integration
--  require('plugins.git_worktree'),
--  require('plugins.neogit'),
--  require('plugins.gitsigns'),
--  require('plugins.vim_fugitive'),
--
--  -- LSP and Autocompletion
    require('plugins.treesitter'),                  -- Syntax highlighting
    require('plugins.lsp_config'),                  -- LSP configuration
    require('plugins.luasnip'),                     -- Snip engine
    require('plugins.cmp'),                         -- Completion engine
    require('plugins.copilot_cmp'),         -- Prettify the LSP suggestion panel
    require('plugins.lspkind'),                     -- Prettify the LSP suggestion panel
--  require('plugins.cmp_lsp'),
--  require('plugins.nvim_dap_ui'),
--  require('plugins.nvim_dap_virtual_text'),
--  require('plugins.nvim_dap_go'),

    -- UI Enhancements
    require('plugins.catppuccin'),                  -- Theming
    require('plugins.dev_webicons'),                -- Additional icons
    require('plugins.lualine'),                     -- Status bar
    require('plugins.indent_blankline'),            -- Highlights identing
    require('plugins.transparent'),                 -- Transparent backdrops
    require('plugins.noice'),                       -- Popup menu replacement
    require('plugins.notify'),                      -- Fancy notifications
    require('plugins.twilight'),                    -- Dims inactive areas
--
--  -- Utilities
--  require('plugins.codeium'),
--  require('plugins.codesnap'),
    require('plugins.autopairs'),
    require('plugins.comment'),
    require('plugins.sort'),
    require('plugins.tabular'),
    require('plugins.toggleterm'),
--  require('plugins.vim_sleuth'),
--  require('plugins.todo_comments'),
--  require('plugins.trouble'),
--  require('plugins.vim_surround'),
--  require('plugins.vim_obsession'),
--  require('plugins.go_nvim'),
--  require('plugins.nvim_dap_virtual_text'),
}
