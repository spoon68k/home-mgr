{ config, pkgs, lib, ... }: {

  programs.k9s = {
    enable = true;
    settings = {
      refreshRate = 2;
    };
  };

}
