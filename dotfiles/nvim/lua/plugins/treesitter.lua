-- ~/.config/nvim/lua/plugins/configs/nvim_treesitter.lua

return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    lazy =  false,
    config = function ()

        require('nvim-treesitter.configs').setup {

            modules = {},

            -- A list of parser names, or "all" (the listed parsers MUST always be installed)
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
                                 "python", "java" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            ignore_install = { "javascript" },

            ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
            -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

            highlight = {
                enable = true,
                -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                -- the name of the parser)
                -- list of language that will be disabled
                disable = { "markdown", "markdown_inline" },

                -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                -- disable = function(_, buf)
                --     local max_filesize = 1000 * 1024 -- 1 MB
                --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                --     if ok and stats and stats.size > max_filesize then
                --         return true
                --     end
                -- end,

                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some dupicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    -- Start selection (select current node)
                    init_selection = "vv",
                    -- Expand selection to the next node
                    node_incremental = "vv",
                    -- Expand selection to the “scope” (e.g., function/block)
                    scope_incremental = "vv",
                    -- Shrink (decrement) selection
                    node_decremental = "vx",
                },
            },
        }
    end
}

