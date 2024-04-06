{ config, ... }: {

    programs.git = {
        enable = true;

        extraConfig = {
            init.defaultBranch = "master";
            include.path = "${config.xdg.configHome}/git/profile";
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
