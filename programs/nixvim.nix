{ stdenv, config, pkgs, lib, ... }: {

  # See https://github.com/nix-community/nixvim for configuration details

  programs.nixvim = {
    enable = true;
    plugins.lightline.enable = true;
    plugins.telescope.enable = true;
    plugins.nvim-tree.enable = true;
    colorschemes.gruvbox.enable = true;

    globals.mapleader = ",";

    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
