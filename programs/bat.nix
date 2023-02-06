{ config, pkgs, lib, ... }: {

  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      style = "numbers,changes,header,grid";
      italic-text = "always";
      pager = "less -F";
    };
  };

  home.shellAliases = {
    cat = "bat";
  };

}
