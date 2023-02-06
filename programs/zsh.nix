{ config, pkgs, lib, ... }: {

  programs.zsh = {
    enable = true;
    history = {
      size = 1000;
    };
    loginExtra = ''
      any-nix-shell zsh --info-right | source /dev/stdin
    '';
    oh-my-zsh = {
      enable = true;
    };
    plugins = [
    ];
  };

  home.sessionVariables = {
    SHELL = "~/.nix-profile/bin/zsh";
  };

}
