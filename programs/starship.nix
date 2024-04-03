{ config, pkgs, lib, ... }: {

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = false;
            command_timeout = 1000;
            username = {
                show_always = true;
            };
            hostname = {
                ssh_only = false;
            };
        };
    };

}
