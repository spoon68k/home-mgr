{ config, pkgs, lib, ... }: {

  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
#    configFile = ''
#      set -g default-command "${pkgs.zsh}/bin/zsh"
#    '';
  };

}
