{ settings, pkgs, lib, ... }: {

    programs.git = {
        enable = true;
        userName = settings.git.user;
        userEmail = settings.git.email;

        extraConfig = {
            init.defaultBranch = "master";
            color.ui = true;
            core = {
                autocrlf = "false";
            };
            credential = {
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
