{ ... }: {

    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            add_newline = false;
            command_timeout = 5000;
            username = {
                show_always = true;
            };
            hostname = {
                ssh_only = false;
            };
        };
    };

}
