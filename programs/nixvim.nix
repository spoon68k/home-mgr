{ ... }: {

  # See https://github.com/nix-community/nixvim for configuration details

  programs.nixvim = {
    enable = true;

    plugins.lightline.enable = true;
    plugins.telescope.enable = true;
    plugins.nvim-tree.enable = true;
    plugins.treesitter.enable = true;

    plugins.lsp = {
      enable = true;
      enabledServers = [ "nil_ls" "pyright" ];
      keymaps.lspBuf = {
	"gd" = "definition";
#	"gr" = "references";
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
	action = "<cmd>Telescope buffers<CR>";
      };
      normal."<C-s>" = {
	silent = true;
	action = "<cmd>Telescope find_files<CR>";
      };
      normal."<C-f>" = {
	silent = true;
	action = "<cmd>Telescope live_grep<CR>";
      };
      normal."<leader>gr" = {
	silent = true;
	action = "<cmd>Telescope lsp_references<CR>";
      };
    };
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
