{ stdenv, config, pkgs, lib, ... }: {

  programs.nixvim = {
    enable = true;
    plugins.lightline.enable = true;
    colorschemes.gruvbox.enable = true;

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
