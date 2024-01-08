{ config, pkgs, lib, ... }: {

    programs.nixneovim = {

        enable = true;

        options = {
            number = true;
            relativenumber = true;
            shiftwidth = 4;
            expandtab = true;
            tabstop = 4;
            cursorline = true;
            cursorcolumn = true;
            conceallevel = 2;
        };

        globals = {
            mapleader = ",";
        };

        colorschemes = {
            tokyonight = {
                enable = true;
                style = "night";
            };
        };

        mappings = {

            normal = {
                "<leader>/" = {
                    action = "'<cmd>noh<CR>'";
                    silent = true;
                };
                "<leader>d" = {
                    action = "'<cmd>NvimTreeToggle<CR>'";
                    silent = true;
                };
                "<leader>f" = {
                    action = "'<cmd>NvimTreeFindFile<CR>'";
                    silent = true;
                };
                "<leader>t" = {
                    action = "'<cmd>Telescope<CR>'";
                    silent = true;
                };
                "<C-b>" = {
                    action = "'<cmd>Telescope buffers<CR>'";
                    silent = true;
                };
                "<C-f>" = {
                    action = "'<cmd>Telescope find_files<CR>'";
                    silent = true;
                };
                "<C-g>" = {
                    action = "'<cmd>Telescope live_grep<CR>'";
                    silent = true;
                };
                "<leader>zn" = {
                    action = "'<cmd>ZkNew { dir = vim.fn.expand(\\'%:p:h\\'), title = vim.fn.input(\\'Title: \\') }<CR>'";
                    silent = true;
                };
                "<leader>zb" = {
                    action = "'<Cmd>ZkBacklinks<CR>'";
                    silent = true;
                };
                "<leader>zl" = {
                    action = "'<Cmd>ZkLinks<CR>'";
                    silent = true;
                };
                "<leader>zz" = {
                    action = "'<cmd>Telescope zk notes<CR>'";
                    silent = true;
                };
            };

            visual = {
                "<leader>znt" = {
                    action = "':\\'<,\\'>ZkNewFromTitleSelection { dir = vim.fn.expand(\\'%:p:h\\') }<CR>'";
                    silent = true;
                };
                "<leader>znc" = {
                    action = "':\\'<,\\'>ZkNewFromContentSelection { dir = vim.fn.expand(\\'%:p:h\\'), title = vim.fn.input(\\'Title: \\') }<CR>;'";
                    silent = true;
                };
                "<leader>za" = {
                    action = "':\\'<,\\'>lua vim.lsp.buf.range_code_action()<CR>'";
                    silent = true;
                };
             };

            normalVisualOp = {
                "Y" = "'Y'";
            };
        };

        plugins = {

            lightline = {
                enable = true;
            };

            lsp-lines = {
                enable = true;
            };

            lspconfig = {
                enable = true;
                servers = {
                    bashls.enable = true;
                    rnix-lsp.enable = true;
                };
            };

            lspkind = {
                enable = true;
            };

            mini = {
                enable = true;
                surround.enable = true;
            };

            neogit = {
                enable = true;
            };

            nvim-cmp = {
                enable = true;
                sources = {
                    nvim_lsp.enable = true; 
                    luasnip.enable = true;
                };
                snippet = {
                    luasnip.enable = true;
                };
                mappingPresets = [ "insert" ];
                mapping = {
                    "<CR>" = "cmp.mapping.confirm({ select = true })";
                    "<Tab>" = {
                        modes = [ "i" "s" ];
                        action = ''
                            function(fallback)
                                if cmp.visible() then
                                    cmp.select_next_item()
                                else
                                    fallback()
                                end
                            end 
                        '';
                    };
                };
                formatting.fields = [ "kind" "abbr" "menu" ];
            };

            nvim-tree = {
                enable = true;
                view = {
                    side = "left";
                    width = "20%";
                };
            };

            telescope = {
                enable = true;
            };

            treesitter = {
                enable = true;
                indent = true;
            };

            zk = {
                enable = true;
                picker = "telescope";
            };

       };

        extraPlugins = [
            pkgs.vimExtraPlugins.nvim-toggleterm-lua
            pkgs.vimExtraPlugins.auto-save-nvim
        ];

        extraConfigVim = ''
            lua << EOF

                require("toggleterm").setup {
                    open_mapping = [[<C-t>]],
                    direction = "float"
                };

                require("auto-save").setup {
                    enable = true;
                };

                vim.api.nvim_create_autocmd('LspAttach', {
                    desc = 'LSP actions',
                    callback = function()
                        local bufmap = function(mode, lhs, rhs)
                            local opts = { buffer = true}
                            vim.keymap.set(mode, lhs, rhs, opts)
                        end

                        bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                        bufmap('n', '<CR>', '<cmd>lua vim.lsp.buf.definition()<cr>')
                        bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                        bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                        bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
                        bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
                        bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                        bufmap('n', 'gS', '<cmd>Telescope lsp_document_symbols<cr>')
                        bufmap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>')
                        bufmap('n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<cr>')
                        bufmap('n', 'gW', '<cmd>Telescope lsp_workspace_symbols<cr>')
                        bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
                        bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
                        bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
                    end
                });
            EOF
        '';

    };

    home.shellAliases = {
        vi = "nvim";
        vim = "nvim";
    };

}