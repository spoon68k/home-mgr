{ ... }: {

  # See https://github.com/nix-community/nixvim for configuration details

  programs.nixvim = {
    enable = true;

    plugins.lightline.enable = true;
    plugins.telescope.enable = true;

    plugins.toggleterm = {
      enable = true;
      direction = "float";
      openMapping = "<C-t>";
    };

    plugins.treesitter = {
      enable = true;
      indent = true;
    };

    plugins.nvim-tree = {
      enable = true;
      view = {
	side = "right";
	width = {
	  min = 30;
	};
      };
    };

    plugins.lsp = {
      enable = true;
      enabledServers = [ "nil_ls" "pyright" ];
      keymaps.lspBuf = {
	"gd" = "definition";
	"gt" = "type_definition";
	"gi" = "implementation";
	"R"  = "rename";
	"K"  = "hover";
      };
    };

    plugins.nvim-cmp = {
      enable = true;
      sources = [
	{ name = "nvim_lsp"; }
      ];
      mapping = {
	"<CR>" = "cmp.mapping.confirm({ select = true })";
	"<Tab>" = {
	  modes = [ "i" "s" ];
	  action = "
	    function(fallback) 
	      if cmp.visible() then
		cmp.select_next_item()
	      else
		fallback()
	      end
	    end
	  ";
	};
      };
    };

    colorschemes.gruvbox.enable = true;

    globals.mapleader = ",";

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    maps = {
      normalVisualOp."Y" = "Y";
      normal."<leader>f" = {
	silent = true;
	action = "<cmd>NvimTreeToggle<CR>";
      };
      normal."<leader>t" = {
	silent = true;
	action = "<cmd>Telescope<CR>";
      };
      normal."<leader>l" = {
	silent = true;
	action = "<cmd>NvimTreeFindFile<CR>";
      };
      normal."<A-S-Up>" = {
	silent = true;
	action = "<cmd>m .-2<CR>";
      };
      normal."<A-S-Down>" = {
	silent = true;
	action = "<cmd>m .+1<CR>";
      };
      normal."<C-b>" = {
	silent = true;
	action = "<cmd>Telescope buffers<CR>";
      };
      normal."<C-f>" = {
	silent = true;
	action = "<cmd>Telescope find_files<CR>";
      };
      normal."<C-g>" = {
	silent = true;
	action = "<cmd>Telescope live_grep<CR>";
      };
      normal."<leader>gr" = {
	silent = true;
	action = "<cmd>Telescope lsp_references<CR>";
      };
      terminal."<Esc>" = {
	silent = true;
	action = "<C-\\><C-n>";
      };
    };
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
