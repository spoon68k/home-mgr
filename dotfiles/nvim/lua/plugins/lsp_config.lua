-- ~/.config/nvim/lua/plugins/configs/lspconfig.lua

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'j-hui/fidget.nvim',
    },
    lazy = false,
    config = function()

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }

        lspconfig.pyright.setup {
            capabilities = capabilities
        }

        lspconfig.rust_analyzer.setup {
            settings = {
                ['rust-analyxer'] = {},
            },
        }

    end
}

