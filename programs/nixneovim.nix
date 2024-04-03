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
                "<leader>hm" = {
                    action = "'<cmd>lua require(\\'harpoon.mark\\').add_file()<CR>'";
                    silent = true;
                };
                "<leader>hh" = {
                    action = "'<cmd>lua require(\\'harpoon.ui\\').nav_next()<CR>'";
                    silent = true;
                };
                "<leader>hv" = {
                    action = "'<cmd>Telescope harpoon marks<CR>'";
                    silent = true;
                };
                "<leader>n" = {
                    action = "'<cmd>lua insert_current_date()<CR>'";
                    silent = true;
                };
                "<leader>za" = {
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
                "<leader>zn" = {
                    action = "'<cmd>Telescope zk notes<CR>'";
                    silent = true;
                };
                "<leader>zt" = {
                    action = "'<cmd>ZkTags<CR>'";
                    silent = true;
                };
                "<leader>zi" = {
                    action = "'<cmd>e initpage.md<CR>'";
                    silent = true;
                };
                "<leader>zd" = {
                    action = "'<cmd>lua create_journal_note()<CR>'";
                    silent = true;
                };
            };

            visual = {
                "<leader>znt" = {
                    action = "':\\'<,\\'>ZkNewFromTitleSelection { dir = vim.fn.expand(\\'%:p:h\\') }<CR>'";
                    silent = true;
                };
                "<leader>znc" = {
                    action = "':\\'<,\\'>ZkNewFromContentSelection { dir = vim.fn.expand(\\'%:p:h\\'), title = vim.fn.input(\\'Title: \\') }<CR>'";
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
                    pyright.enable = true;
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
            pkgs.vimExtraPlugins.harpoon
        ];

        extraConfigVim = "lua <<EOF\n" + builtins.readFile(./nixneovim-conf.lua) + "\nEOF";
    };

    home.shellAliases = {
        vi = "nvim";
        vim = "nvim";
    };

}
