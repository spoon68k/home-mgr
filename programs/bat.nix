{ ... }: {

    programs.bat = {
        enable = true;
        config = {
            theme = "DarkNeon";
            style = "numbers,changes,header,grid";
            italic-text = "always";
            pager = "less -F";
        };
    };

    home.shellAliases = {
        cat = "bat --theme=DarkNeon";
    };

}
