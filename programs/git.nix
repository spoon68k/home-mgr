{ settings, pkgs, lib, ... }: {

  programs.git = {
    enable = true;
    userName = builtins.trace settings.git.user settings.git.user;
    userEmail = settings.git.email;

    extraConfig = {
      color.ui = true;
      core = {
        autocrlf = "false";
      };
      credentials = {
        helper = "store";
      };
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        decorations = {
          commit-decorations-style = "bold yellow box ul";
          file-style = "bold yellow";
          file-decoration-style = "none";
        };
      };
    };
  };

}
