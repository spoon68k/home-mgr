{ config, pkgs, lib, ... }: {

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type file --follow";
    defaultOptions = [ "--height 30%" ];
    fileWidgetCommand = "fd --type file --follow";
    fileWidgetOptions = [ "--previous 'bat -- style=numbers --color=always --line-range :500 {}'" ];
  };

  home.shellAliases = {
    vif = "vi `fzf`";
  };

}
