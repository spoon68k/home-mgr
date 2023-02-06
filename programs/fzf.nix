{ config, pkgs, lib, ... }: {

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file --follow";
    defaultOptions = [ "--height 50%" ];
    fileWidgetCommand = "fd --type file --follow";
  };

  home.shellAliases = {
    vif = "vi `fzf`";
  };

}
